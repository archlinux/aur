# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Ding Xiao <tinocodfcdsa10@mails.tsinghua.edu.cn>
# Contributor: Firmy <firmianay@gmail.com>
pkgname="python-pwntools"
_pyname="pwntools"
pkgver="4.0.0beta0"
pkgrel=1
pkgdesc="A CTF framework and exploit development library"
arch=('any')
url='https://github.com/Gallopsled/pwntools'
license=('MIT' 'GPL2' 'BSD')
depends=('python'
         'python-mako'
         'python-pyelftools'
         'python-capstone'
         'ropgadget'
         'python-pyserial'
         'python-requests'
         'python-pip'
         'python-pygments'
         'python-pysocks'
         'python-dateutil'
         'python-packaging'
         'python-psutil'
         'python-intervaltree'
         'python-sortedcontainers'
         'python-unicorn'
         'ropgadget')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Gallopsled/pwntools/archive/${pkgver}.tar.gz")
sha256sums=('cc00b2bf53553d3694870c521903a5b801eacfae02dbacf9e7b0e37e81dbe275')
b2sums=('da4ac34c71be251d634b8f49a9e0a06a853963f520ecd660828401f901ef35c642958724c981fe417a47561075efc675a966ed88a059e483b78f8a143d97f593')

build() {
  cd "${_pyname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --skip-build --only-use-pwn-command
  install -D -m 644 LICENSE-pwntools.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}"/usr/lib/python*/site-packages/*.{txt,md}
}

# vim:set ts=2 sw=2 et:
