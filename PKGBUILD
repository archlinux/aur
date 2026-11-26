# skwird-bin for the AUR (docs/PLAN.md, 0.3.0, step 5): skwird's plain
# Linux build, as its release gives it (tools/package/linux.sh), installed
# as the skwird package installs its own build (dist/aur/PKGBUILD), the
# same files and the same hooks (skwird.install): for a system with no
# Rust to build it. It stands for skwird, which it conflicts with.
# skwird's repository tries it from the archive it builds
# (tools/package/aur-bin.sh), its checksum SKIP; the AUR's copy holds the
# release's archive's (updpkgsums).
# Maintainer: The skwir authors

pkgname=skwird-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='An index of file names kept current, answered over a local socket (its release'"'"'s build)'
arch=('x86_64')
url='https://skwir.org'
# Where its releases are published.
_repo='https://github.com/skwir-org/skwird'
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc')
provides=("skwird=$pkgver")
conflicts=('skwird')
install=skwird.install
source=("skwird-$pkgver-linux-x86_64.tar.gz::$_repo/releases/download/v$pkgver/skwird-$pkgver-linux-x86_64.tar.gz")
sha256sums=('7442a9e140f9ad59f079d27ca0d24d1beb0537832f0fded55b382a800f8e5256')

package() {
  cd "skwird-$pkgver-linux-x86_64"
  install -Dm755 skwird -t "$pkgdir/usr/bin"
  install -Dm644 systemd/skwird.service systemd/skwird.socket -t "$pkgdir/usr/lib/systemd/user"
  install -Dm644 systemd/skwird-system.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 sysusers/skwird.conf -t "$pkgdir/usr/lib/sysusers.d"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 THIRD-PARTY-NOTICES.txt "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
