# Maintainer: Cole Leavitt <coleleavitt@protonmail.com>

pkgname=sf
pkgver=2.143.6
pkgrel=1
pkgdesc="A tool for creating and managing Salesforce DX projects from the command line"
arch=('x86_64')
url="https://developer.salesforce.com/tools/salesforcecli"
license=('BSD')
depends=('nodejs')
optdepends=('gnome-keyring: for saving default credentials')
provides=('sf')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.xz::https://developer.salesforce.com/media/salesforce-cli/sf/channels/stable/sf-linux-x64.tar.xz")
sha256sums=('117b80ef8194be28a580296e204b79b29f86a5c3ac4bfba18c085d25f3e76aca')
changelog=CHANGELOG

prepare() {
    cd "${srcdir}/sf"
    # Add any necessary preparation steps here
}

check() {
    cd "${srcdir}/sf"
    # Add any test commands here
}

package() {
    install_dir="/opt/${pkgname}"

    # Create the installation directory
    install -dm755 "${pkgdir}${install_dir}"

    # Copy all files from the extracted directory to the installation directory
    cp -a "${srcdir}/sf/"* "${pkgdir}${install_dir}"

    # Set executable permissions for the sf binary
    chmod +x "${pkgdir}${install_dir}/bin/sf"

    # Create a symlink in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "${install_dir}/bin/sf" "${pkgdir}/usr/bin/sf"

    # Install license file
    install -Dm644 "${srcdir}/sf/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
    echo "To check for Salesforce CLI updates, run:"
    echo "    sf update"
}

