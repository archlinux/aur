# Maintainer: David Raznick <david.raznick@globalenergymonitor.org>
#
# Prebuilt-binary package, repackaging the GitHub release artifacts.
# After each release: bump pkgver, reset pkgrel, run `updpkgsums`.
#
# This is the window version. The command-line `sqlnow` is packaged separately
# as sqlnow-bin: the two are the same server and the same session store, so
# either can open a session the other left, and both can be installed at once.
pkgname=sqlnow-desktop-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Local SQL viewer for files and databases, in a native window"
arch=('x86_64' 'aarch64')
url="https://github.com/kindly/sqlnow"
# a prebuilt binary is taken as it was released: stripping it here would
# rewrite a file whose checksum was just verified, and there are no debug
# symbols in it to split out
options=('!strip' '!debug')
license=('MIT')
# the binary carries the UI and DuckDB inside it, but links the host's web
# stack: webkit2gtk-4.1 is what it renders in, and it pulls gtk3 with it
depends=('webkit2gtk-4.1' 'gtk3' 'gcc-libs' 'glibc')
optdepends=('sqlnow-bin: the command-line version, sharing the same sessions')
provides=('sqlnow-desktop')
conflicts=('sqlnow-desktop')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/sqlnow-desktop-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/sqlnow-desktop-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a32c76fb0f455bad2c3fc6d6fd5c6a71bc7c788f582581a714afd10fe434c05f')
sha256sums_aarch64=('79abf2f3f4b7cf0456d7740aacde2e6da9ed46a972e3742996df4cc524800ae2')

package() {
    install -Dm755 sqlnow-desktop "$pkgdir/usr/bin/sqlnow-desktop"
    install -Dm644 sqlnow-desktop.desktop \
        "$pkgdir/usr/share/applications/sqlnow-desktop.desktop"
    install -Dm644 sqlnow-desktop.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/sqlnow-desktop.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/sqlnow-desktop/README.md"
    install -Dm644 AGENTS.md "$pkgdir/usr/share/doc/sqlnow-desktop/AGENTS.md"
}
