# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# shellcheck disable=SC2034,SC2154

pkgname=censo
_pkgname=CENSO
pkgver=2.1.2
pkgrel=2
pkgdesc="Commandline ENergetic SOrting of Conformer Rotamer Ensembles "
arch=('any')
url="https://xtb-docs.readthedocs.io/en/latest/CENSO_docs/censo.html"
license=('LGPL-3.0-only' 'GPL-3.0-only')
makedepends=(
  'python-setuptools-scm'
)
depends=(
  'bash'
  'python'
  'python-matplotlib'
  'python-numpy'
  'python-pandas'
)
source=("https://github.com/grimme-lab/CENSO/releases/download/v${pkgver}/censo-${pkgver}.tar.gz")
b2sums=('18acd5030c049d00f22deb5ad67d7ece24548d76ad0638449135a07a62e910a940f6dba527cd6c4aebcebe2448bb549cc87e53a33e488242ef6b963c09664894')

build() {
  cd "censo-$pkgver" || exit 1
  python -m build --wheel --no-isolation
}

check() {
  true
}

package(){
  cd "censo-$pkgver" || exit 1

  # install cli
  install -Dm755 bin/c2anmr "$pkgdir"/usr/bin/c2anmr
  install -Dm755 bin/censo "$pkgdir"/usr/bin/censo
  install -Dm755 bin/uvvisplot "$pkgdir"/usr/bin/uvvisplot

  # install python modules
  python -m installer --destdir="$pkgdir" dist/*.whl
}
