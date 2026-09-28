# Maintainer: CxOrg <clx.org@cloud-org.uk>
pkgbase=pam-fprint-helper
pkgname=('pam-fprint-helper' 'pam-open-fprint-helper')
pkgver=1.0
pkgrel=3
pkgdesc="Fingerprint authorization (pam_fprintd) for privileged access on Arch/KDE Plasma: polkit, sudo, su, login, SDDM/LightDM, themed root GUI apps"
arch=('any')
url="https://github.com/ixnewton/PamFprint"
license=('GPL-3.0-or-later')
install=pam-fprint-helper.install
_commit=3fc1f97ebd192375ef28068566a570a9d7174461
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ixnewton/PamFprint/archive/$_commit.tar.gz")
sha256sums=('ec0879cf5750ab5271ee95fd681f8bb8b8f9477262b482299b00cf2678b6f7a3')

package_pam-fprint-helper() {
  pkgdesc+=" (fprintd backend)"
  depends=('bash' 'fprintd' 'polkit')
  conflicts=('pam-open-fprint-helper')
  optdepends=(
    'krusader: root file-manager launcher'
    'ksystemlog: root system-log viewer launcher'
    'zenmap: root network-scanner launcher'
  )

  _package_files
}

package_pam-open-fprint-helper() {
  pkgdesc+=" (open-fprintd backend)"
  depends=('bash' 'open-fprintd' 'polkit')
  provides=('pam-fprint-helper')
  conflicts=('pam-fprint-helper')
  optdepends=(
    'krusader: root file-manager launcher'
    'ksystemlog: root system-log viewer launcher'
    'zenmap: root network-scanner launcher'
  )

  _package_files
}

_package_files() {
  cd "$srcdir/PamFprint-$_commit"
  install -dm755 "$pkgdir/usr/share/pamfprint"
  cp -a files install.sh uninstall.sh README.md "$pkgdir/usr/share/pamfprint/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
