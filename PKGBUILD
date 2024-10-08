# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
_name=${pkgname#python-}
pkgname=python-ippserver
pkgver=0.2
pkgrel=1
pkgdesc="IPP server implementing enough of IPP to fool CUPS into thinking its a real printer."
arch=('any')
url="https://github.com/h2g2bob/ipp-server"
license=('custom')
depends=(python)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('01ae4d6903dc2293a76ed90d1ec8fe6790345728850432f0da53adf1f2ad6c749f645653844804da242f4bbb7fac1911f3ec2353c1ec5a36e716d5a44adf2e47')

# https://wiki.archlinux.org/title/Python_package_guidelines
build() {
  cd ipp-server-$pkgver
  python setup.py build
}

package() {
  cd ipp-server-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
