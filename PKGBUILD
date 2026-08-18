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
pkgver=6.0.4
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
sha256sums_x86_64=('777e33c598440f86391afb8b0eefa257b21ba650a257853c6167fdc2c4c57dd2')
sha256sums_aarch64=('6979d9c8da7b6a2e619b29fa80ca8beec1fe844c92fc5145f7bb95262464b26f')
options=(!strip)

package() {
    # Install commercial license
    install -Dm644 LICENSE-COMMERCIAL "${pkgdir}/usr/share/licenses/${pkgname}/BeekeeperStudioApplicationEULA"

    # Extract prebuilt package into pkgdir
    cd "${srcdir}"
    bsdtar -xf "${_pkgname}-${pkgver}-${CARCH}.tar.xz" -C "${pkgdir}"

    # Remove prebuilt package metadata files (if they exist)
    cd "${pkgdir}"
    rm -f .PKGINFO .MTREE .INSTALL

    # Symlink executable to /usr/bin
    install -dm0755 "${pkgdir}/usr/bin"
    ln -s "/opt/Beekeeper Studio/beekeeper-studio" "${pkgdir}/usr/bin/beekeeper-studio"
}
