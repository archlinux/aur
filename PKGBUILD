# Maintainer: Day Matchullis <notnightbut [at] duck [dot] com>
# Contributor: xYc4t <xYc4t [at] proton [dot] me>
# Contributor: Winston Astrachan <rew1red [at] rew1 [dot] red>
# Contributor: xiota
# Contributor: Benjamin Hedrich <code [at] pagenotfound [dot] de>
# Contributor: Sitansh Rajput <me [at] lostpolaris [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

_pkgname="beekeeper-studio"
pkgname="$_pkgname-bin"
pkgver=5.5.6
pkgrel=1
pkgdesc="Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more"
arch=('x86_64' 'aarch64')
url="https://github.com/beekeeper-studio/beekeeper-studio"
license=(
  'GPL-3.0-or-later'
  'LicenseRef-BeekeeperStudioApplicationEULA'
)
depends=(
    'alsa-lib'
    'gtk3'
    'nspr'
    'nss'
)
provides=("$_pkgname")
source=("LICENSE-COMMERCIAL")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.xz::$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}.pacman")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.xz::$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64.pacman")
noextract=(
    "${_pkgname}-${pkgver}-x86_64.tar.xz"
    "${_pkgname}-${pkgver}-aarch64.tar.xz"
)
sha256sums=('9e83b98f1773a830db2b30043051d4e179fea73cdb0168feb7b2965ee6075ebf')
sha256sums_x86_64=('2e0615071def70bfaf3dfc3721b901cc0e578316eb6719f66415fe8630e072e7')
sha256sums_aarch64=('fd96a65cc8a6188dfec658a007291bf1657af6cceab50c8087f394c44f09f567')

package() {
    # Install commercial license
    install -Dm644 LICENSE-COMMERCIAL "${pkgdir}/usr/share/licenses/${pkgname}/BeekeeperStudioApplicationEULA"

    # Extract prebuilt package into pkgdir
    cd "$srcdir"
    bsdtar -xf "${_pkgname}-${pkgver}-${CARCH}.tar.xz" -C "$pkgdir"

    # Remove prebuilt package metadata files (if they exist)
    cd "$pkgdir"
    rm -f .PKGINFO .MTREE .INSTALL
}
