# Maintainer:
# Contributor: lukasbecker2 [at] [common mail ending from the company with for the most used search engine in the us and the eu]
# Contributor: Manuel Mendez <mmendez534@gmail.com>
# Contributor: Robin Martinjak <rob@kingofnerds.net>

pkgname='makeself-git'
pkgrel=1
pkgver=2.6.0.r4.ga9d64f3
pkgdesc='Utility to create self-extracting packages'
arch=('any')
url='https://makeself.io/'
license=('GPL-2.0-or-later')
depends=('bash')
makedepends=('git')
source=("$pkgname::git+https://github.com/megastep/makeself.git")
sha256sums=('SKIP')
conflicts=('makeself')
provides=('makeself')

prepare() {
  cd "${pkgname}"
  sed -e 's|^HEADER=.*|HEADER=/usr/share/makeself/makeself-header.sh|' -i 'makeself.sh'
}

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^release-//;s/-/.r/;s/-/./g'
}

package() {
  cd "${pkgname}"
  install -Dpm644 'README.md' -t "${pkgdir}/usr/share/makeself/"
  install -Dpm644 'makeself.1' -t "${pkgdir}/usr/share/man/man1/"
  install -Dpm755 'makeself.sh' "${pkgdir}/usr/bin/makeself"
  install -Dpm755 'makeself-header.sh' -t "${pkgdir}/usr/share/makeself/"
}

# vim:set ts=2 sw=2 et:
