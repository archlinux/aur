#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for mechabar.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="mechabar"

pkgname="waybar-mechabar-git"
pkgver="r246.9d325c3"
pkgrel=1
pkgdesc="A customizable and modular Waybar configuration."
arch=("any")
url="https://github.com/sejjy/${_pkgname}"
license=("MIT")
optdepends=("bluez-utils: Bluetooth."
    "brightnessctl: Display brightness."
    "fzf: Fuzzy finder."
    "libpulse: Sound manipulation."
    "networkmanager: Network."
    "notification-daemon: Notifications."
    "otf-commit-mono-nerd: Font."
    "pacman-contrib: Package manager."
    "ttf-jetbrains-mono-nerd: Font."
    "waybar: Status bar.")
makedepends=("git")
provides=("waybar-mechabar")
source=("${_pkgname}::git+${url}.git")
sha512sums=("SKIP")

pkgver()
{
    cd "${srcdir}"/"${_pkgname}"/ || exit 1
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)" || true
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${_pkgname}"/modules/ "${pkgdir}"/usr/share/"${pkgname}"/
    cp -r "${srcdir}"/"${_pkgname}"/scripts/ "${pkgdir}"/usr/share/"${pkgname}"/
    cp -r "${srcdir}"/"${_pkgname}"/styles/ "${pkgdir}"/usr/share/"${pkgname}"/
    install -Dm644 "${srcdir}"/"${_pkgname}"/config.jsonc "${pkgdir}"/usr/share/"${pkgname}"/
    install -Dm644 "${srcdir}"/"${_pkgname}"/style.css "${pkgdir}"/usr/share/"${pkgname}"/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${_pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
