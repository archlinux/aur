# Maintainer:  lukasbecker2 [at] [common mail ending from the company with for the most used search engine in the us and the eu]
# Contributor: Manuel Mendez <mmendez534@gmail.com>
# Contributor: Robin Martinjak <rob@kingofnerds.net>
# This script is based on the makeself PKGBUILD

# vim:set ts=2 sw=2 et:

pkgname='makeself-git'
pkgrel=1
pkgver=2.4.2_4_g39da42d
pkgdesc='Utility to create self-extracting packages'
arch=('any')
url='http://megastep.org/makeself'
license=('GPLv2')
depends=('bash')
makedepends=('git')
source=("makeself-git::git://github.com/megastep/makeself.git")
sha256sums=('SKIP')
conflicts=('makeself')

prepare() {
  cd "${pkgname}"
  sed -e 's|^HEADER=.*|HEADER=/usr/share/makeself/makeself-header.sh|' -i 'makeself.sh'
}


pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed "s/release\-//g" | sed "s/-/\_/g"
}

package() {
  cd "${pkgname}"
  install -Dpm644 'makeself.lsm' 'README.md' -t "${pkgdir}/usr/share/makeself/"
  install -Dpm644 'makeself.1' -t "${pkgdir}/usr/share/man/man1/"
  install -Dpm755 'makeself.sh' "${pkgdir}/usr/bin/makeself"
  install -Dpm755 'makeself-header.sh' -t "${pkgdir}/usr/share/makeself/"
}

