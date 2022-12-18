# Maintainer: BlackCatDevel0per <bcdev@mail.ru>
# https://github.com/BlackCatDevel0per

pkgname=pypy3-bin
pkgver=7.3.10
pkgrel=3
pkgdesc="A Python implementation written in Python, JIT enabled"
url="https://pypy.org"
arch=('x86_64' 'aarch64')
depends=('bzip2' 'openssl' 'zlib')
provides=('pypy3')
conflicts=('pypy3')
options=(!buildflags)
license=('MIT')
source_x86_64=("https://downloads.python.org/pypy/pypy3.8-v${pkgver}-linux64.tar.bz2")
source_aarch64=("https://downloads.python.org/pypy/pypy3.8-v${pkgver}-aarch64.tar.bz2")
sha512sums_x86_64=('6824d813d086e50285e7104133e7e5f98c9da66e69730416cd13d00380a43f3865e2514a153db5f6022dd0de9ff61ebcd40f72e5924939d05c8eb83cd6467b9f')
sha512sums_aarch64=('26a27d75cf47bd8129eea906b03c9bdd457c33d0da5c4c595ff5f6d8b2f01e0f27ef05a754f84805974d62aa8e7f0fce78b49a75953d1af1d3f39833d1b2811c')

package() {
  [ "$CARCH" = "x86_64" ] && cd pypy3.8-v${pkgver}-linux64
  [ "$CARCH" = "aarch64" ] && cd pypy3.8-v${pkgver}-aarch64

  # Fix permissions
  find . -type d -exec chmod +rx {} \;
  find . -name '*.so*' -exec chmod +rx {} \;

  # Install pypy3
  mkdir -p "${pkgdir}"/opt/pypy3/
  cp -r * "${pkgdir}"/opt/pypy3/

  # Install symlink
  mkdir -p "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib
  ln -s /opt/pypy3/bin/pypy3 "${pkgdir}"/usr/bin/pypy3
  ln -s /opt/pypy3/bin/libpypy3.8-c.so "${pkgdir}"/usr/lib/libpypy3.8-c.so

  # Install misc stuff
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/pypy3/LICENSE
}
# vim: ts=2 sw=2 et:
