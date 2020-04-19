# Maintainer: drakkan <nicola dot murino at gmail dot com>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: Christopher Krooß <didi2002 at web.de>

pkgname=gnome-shell-extension-dash-to-dock
_pkgname=dash-to-dock
pkgver=67+81+g3e1d49a
pkgrel=2
pkgdesc="Move the dash out of the overview transforming it in a dock"
arch=('any')
url="https://micheleg.github.io/dash-to-dock/"
license=('GPL')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'git')
_commit=3e1d49af1876e83abd1d16baab24cb263ca53360
source=("git+https://github.com/micheleg/dash-to-dock.git#commit=$_commit"
  "https://patch-diff.githubusercontent.com/raw/micheleg/dash-to-dock/pull/1171.patch")
sha256sums=('SKIP'
  '13bb4cdb9701d0311c63a96f03decbe2807b88578fe7c61344e1cfb0f28606dc')

pkgver() {
  cd "${srcdir}"/${_pkgname}
  git describe --tags | sed 's/^extensions\.gnome\.org-v//g' | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}"/${_pkgname}
  patch -Np1 -i "$srcdir/1171.patch"
}

build() {
  cd "${srcdir}"/${_pkgname}
  make
}

package() {
  cd "${srcdir}"/${_pkgname}
  make DESTDIR="${pkgdir}" VERSION="${pkgver}" install
}

# vim:set ts=2 sw=2 et:
