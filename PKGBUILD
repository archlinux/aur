# Maintainer: Joseph DiGiovanni <jdigiovanni78 at gmail dot com>

pkgname=gnome-shell-extension-fullscreen-to-new-workspace-git
pkgdesc="Fullscreen to New Workspace Gnome Extension (Revived Version)"
pkgver=r53.18faccb
pkgrel=3

source=("git+https://github.com/corgijan/fullscreen-to-new-workspace.git")
sha256sums=(SKIP)

arch=('any')
url="https://github.com/corgijan/fullscreen-to-new-workspace"
license=('GPL3')
depends=('gnome-shell>=48')
provides=('gnome-shell-extension-fullscreen-to-new-workspace')
conflicts=('gnome-shell-extension-fullscreen-to-new-workspace')

_pkgname=fullscreen-to-new-workspace

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  _uuid="fullscreen-to-empty-workspace2@corgijan.dev"
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d "${_install_dir}"
  cp -r "src/"* -t "${_install_dir}/"

  install -Dvm644 "src/schemas/org.gnome.shell.extensions.fullscreen-to-empty-workspace.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"

  install -Dvm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
