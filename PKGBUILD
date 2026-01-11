# Maintainer: Eshu Team <support@eshu-apps.com>
pkgname=eshu-installer
pkgver=0.4.6
pkgrel=1
pkgdesc="AI-Driven Universal Package Installer for Linux"
arch=('any')
url="https://eshu-apps.com"
license=('MIT')
depends=('python>=3.9' 'python-pip' 'git')
optdepends=(
    'ollama: For local AI support'
    'timeshift: For system snapshots'
    'snapper: For system snapshots (alternative)'
    'distrobox: For Ghost Mode'
    'podman: For Ghost Mode (alternative)'
)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/eshu-apps/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4593e8218f5fdded7eb456f63edcc1f92ab7165d6725f652ee0758813562d9f9')

package() {
    cd "$pkgname-$pkgver"

    # Install all source files to /usr/share
    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r src setup.py requirements.txt LICENSE README.md systemd "$pkgdir/usr/share/$pkgname/"

    # Install the installer script
    install -Dm755 install-eshu.sh "$pkgdir/usr/share/$pkgname/install-eshu.sh"
}

# vim:set ts=2 sw=2 et:
