# Maintainer: akn19 <akn19@users.noreply.github.com>
#
# Published by .github/workflows/release.yml once the installers are attached to the release: the workflow sets pkgver
# to the release tag, the deploy action fills in the checksum of the download (updpkgsums) and pushes this file to the
# AUR as the package `rakkomik-bin`.
#
# The package is prebuilt, so nothing is built and no build dependencies are installed: it is the Arch package that every
# release has attached (rakkomik-<version>-1-any.pkg.tar.zst, built by packaging/arch/PKGBUILD in build-app.yml), and its
# files are installed as they are. It runs on the system `electron` package, like the package it repacks.

pkgname=rakkomik-bin
_pkgname=rakkomik
pkgver=1.2.5
pkgrel=1
pkgdesc='Manga and comic downloader (prebuilt)'
arch=('any')
url='https://github.com/akn19/rakkomik'
license=('Unlicense')
depends=('bash' 'electron' 'hicolor-icon-theme')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
_file="$_pkgname-$pkgver-1-any.pkg.tar.zst"
source=("$url/releases/download/v$pkgver/$_file")
# unpacked in package(), where fakeroot keeps the owner root of its files
noextract=("$_file")
sha256sums=('9f80a503945e0629aba4caaabd568b44f6b184fad565c3b0f80726d799376b73')

package() {
    # only the files of the package, not the metadata of pacman (.PKGINFO, .BUILDINFO, .MTREE)
    bsdtar -xf "$srcdir/$_file" -C "$pkgdir" usr
}
