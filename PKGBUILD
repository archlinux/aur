# Maintainer: CxOrg <clx.org@cloud-org.uk>
pkgbase=pam-fprint-helper
pkgname=('pam-fprint-helper' 'pam-open-fprint-helper')
pkgver=1.0
pkgrel=2
pkgdesc="Fingerprint authorization (pam_fprintd) for privileged access on Arch/KDE Plasma: polkit, sudo, su, login, SDDM/LightDM, themed root GUI apps"
arch=('any')
url="https://github.com/ixnewton/PamFprint"
license=('GPL-3.0-or-later')
install=pam-fprint-helper.install
_commit=65dac5f2ee4ba47393755c8de22adf2786ec571d
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ixnewton/PamFprint/archive/$_commit.tar.gz")
sha256sums=('60504f1a8ae6c7a304422c97dcc1d7d85444a648125e0b99702d3053083ce438')

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
