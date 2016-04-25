# Submitter: Gen2ly <toddrpartridge@gmail.com> (advanced volume mixer)
# Maintainer: alyst <astukalov@gmail.com>

pkgname=gnome-shell-extension-shell-volume-mixer-git
pkgver=0.11.0.r0.ga615088
_pkgver=`echo "$pkgver" | sed -e s/\\\\.r.\\\\+//`
pkgrel=1
pkgdesc="PulseAudio mixer providing per-device and per-program volume control"
arch=('any')
url="https://extensions.gnome.org/extension/858/volume-mixer/"
license=('GPL2')
depends=('gnome-shell')
makedepends=('unzip' 'zip')
source=("shell-volume-mixer::git://github.com/aleho/gnome-shell-volume-mixer.git")
sha256sums=('SKIP')

pkgver() {
	cd shell-volume-mixer/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
  cd $srcdir/shell-volume-mixer/
  make dist
}

package() {
  ext_dir="$pkgdir/usr/share/gnome-shell/extensions/shell-volume-mixer@derhofbauer.at"
  install -d "$ext_dir"
  unzip $srcdir/shell-volume-mixer/shell-volume-mixer-$_pkgver.zip -d "$ext_dir"
}
