# Maintainer: Jingbei Li <i@jingbei.li>

pkgname=pypy-bin
pkgver=7.3.18
pkgrel=1
pkgdesc="A Python implementation written in Python, JIT enabled"
url="https://pypy.org"
arch=('x86_64' 'aarch64')
depends=('bzip2' 'openssl' 'zlib')
provides=('pypy')
conflicts=('pypy')
options=(!buildflags)
license=('MIT')
source_x86_64=("https://downloads.python.org/pypy/pypy2.7-v${pkgver}-linux64.tar.bz2")
source_aarch64=("https://downloads.python.org/pypy/pypy2.7-v${pkgver}-aarch64.tar.bz2")
sha512sums_x86_64=('2388f62dfc1817cf9e9d5e4b357178992988d7e0b958aa40fb7a8dcab9af89ccf1468a6598aabce1b1c04d8277b12f294f0819048713fee92c940e74785933e8')
sha512sums_aarch64=('25012972e33fb713cac4771dce043f249c588514bb35827eccc2c5bd47fb921a4f7e1945abca69859279f9bb2110bfdb529f2c41f114a111d475e687d906b019')

package() {
  [ "$CARCH" = "x86_64" ] && cd pypy2.7-v${pkgver}-linux64
  [ "$CARCH" = "aarch64" ] && cd pypy2.7-v${pkgver}-aarch64

  # Fix permissions
  find . -type d -exec chmod +rx {} \;
  find . -name '*.so*' -exec chmod +rx {} \;

  # Install pypy
  mkdir -p "${pkgdir}"/opt/pypy/
  cp -r * "${pkgdir}"/opt/pypy/

  # Install symlink
  mkdir -p "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib
  ln -s /opt/pypy/bin/pypy "${pkgdir}"/usr/bin/pypy
  ln -s /opt/pypy/bin/libpypy-c.so "${pkgdir}"/usr/lib/libpypy-c.so

  # Install misc stuff
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/pypy/LICENSE
}
# vim: ts=2 sw=2 et:
