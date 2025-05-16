# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-gpu-profile-selector
_uuid=GPU_profile_selector@lorenzo9904.gmail.com
pkgver=48
pkgrel=1
epoch=1
pkgdesc="Provides a simple way to switch between GPU profiles on NVIDIA Optimus systems"
arch=('any')
url="https://github.com/LorenzoMorelli/GPU_profile_selector"
license=('GPL-3.0-or-later')
depends=('bash' 'envycontrol' 'gnome-shell' 'polkit')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LorenzoMorelli/GPU_profile_selector/archive/gnome-${pkgver}.tar.gz")
sha256sums=('db9c73e5e8c69890f66a8ec31b9685367643041ebdfaedd9e05cb78f335772a6')


build() {
  cd GPU_profile_selector-gnome-48
  gnome-extensions pack \
     --extra-source=img \
     --extra-source=lib \
     --extra-source=ui \
     --force
}

package() {
  cd GPU_profile_selector-gnome-48
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dm644 schemas/org.gnome.shell.extensions.GPU_profile_selector.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
