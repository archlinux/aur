# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Ebubekir KARUL <ebubekirkarul@yandex.com>
# Contributor: s1gma,shirokuro

pkgbase=scapy
pkgname=python2-scapy
pkgver=2.4.4
pkgrel=2
pkgdesc='Powerful interactive packet manipulation program written in Python (library)'
url='http://www.secdev.org/projects/scapy/'
arch=('any')
license=('GPL2')
makedepends=('python2-setuptools')
depends=('tcpdump' 'python2')
optdepends=('python2-cryptography: WEP, IPsec and SSL/TLS support'
            'python2-pyx: psdump() and pdfdump() functions'
            'python2-matplotlib: plotting support'
            'graphviz: conversations() method support'
            'sox: for VOIP support'
        )
source=(https://github.com/secdev/scapy/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('abe1b7fa606350df90209a60d23df727705097453b3dcb626bf36b3539d44021')

prepare() {
  cd ${pkgbase}-${pkgver}
  sed -e 's|env python|env python2|g' -i doc/scapy/*.rst run_scapy $(find . -name '*.py')
}

build() {
  (cd ${pkgbase}-${pkgver}
    python2 setup.py build
  )
}

package() {
  cd ${pkgbase}-${pkgver}
  python2 setup.py install -O1 --skip-build --root="${pkgdir}" --prefix=/usr
  install -Dm 644 doc/scapy/*.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  rm -r "${pkgdir}"{/usr/bin,/usr/share/man}
}

# vim: ts=2 sw=2 et:
