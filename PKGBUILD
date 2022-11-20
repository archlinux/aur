# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-gpu-profile-selector-git
pkgver=r50.4ae007c
pkgrel=1
pkgdesc="A simple gnome-shell extension which provides a simple way to switch between GPU profiles on Nvidia Optimus systems in a few clicks."
arch=('any')
url="https://github.com/LorenzoMorelli/GPU_profile_selector"
license=('GPL3')
depends=('bash' 'envycontrol' 'gnome-shell' 'polkit')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/LorenzoMorelli/GPU_profile_selector.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/GPU_profile_selector"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/GPU_profile_selector"
  gnome-extensions pack \
     --extra-source=img \
     --extra-source=lib \
     --extra-source=ui \
     --extra-source=prefs.xml \
     --force
}

package() {
  cd "$srcdir/GPU_profile_selector"
  _uuid='GPU_profile_selector@lorenzo9904.gmail.com'

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"
}
