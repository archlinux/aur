# Maintainer: nyrda <nyrda@keymasq.tools>

# The MCP server and the tools of a hyprmasq release, prebuilt: hyprmasq-mcp, hyprmasq-input, hyprmasq-launch, and
# hyprmasq-reaper, which the plugin finds in /usr/lib/hyprmasq. They are what the AUR's hyprmasq builds from source,
# built by its PKGBUILD in the project's CI on the oldest userland that runs the plugins, see packaging/aur/build-tools.sh
# of the repository. None of them depends on Hyprland's internals, so a Hyprland update needs no new build. The plugin of
# the same release comes from hyprmasq-plugin-bin.
# The CI of github.com/nyrda/hyprmasq publishes this file from packaging/aur. It sets pkgver to the release, sha256sums
# to its archive of the tools, and pkgrel.

pkgname=hyprmasq-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='Computer use for Hyprland: an MCP server and tools for per-window screenshots and input, prebuilt'
arch=(x86_64)
url='https://github.com/nyrda/hyprmasq'
license=(MIT)
# The plugin of this release or a newer one: yay installs the new hyprmasq-plugin-bin before it builds this package, while
# the old one is still installed, and makepkg checks this before it builds.
depends=(ffmpeg glibc "hyprmasq-plugin>=$pkgver" jq libei libxkbcommon sh)
provides=("hyprmasq=$pkgver")
conflicts=(hyprmasq)
options=(!debug !strip)
source=("hyprmasq-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/hyprmasq-$pkgver-x86_64.tar.gz")
sha256sums=('812d49f5bd8addf7e07c7d4c785322cc397fc1fc7d0188ed2290bfff280be7d0')

package() {
  cd "hyprmasq-$pkgver-x86_64"
  install -Dm755 hyprmasq-input hyprmasq-launch hyprmasq-mcp -t "$pkgdir/usr/bin"
  install -Dm755 hyprmasq-reaper -t "$pkgdir/usr/lib/hyprmasq"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
