# Maintainer: KannarFr <kannarfr@gmail.com>
pkgname=gitlab-inbox-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A glanceable desktop inbox for GitLab things that need your reply (via glab)"
arch=('x86_64')
url="https://github.com/KannarFr/glab-desktop-ui"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'librsvg'
  'libayatana-appindicator'
  'glab'
  'hicolor-icon-theme'
)
optdepends=(
  'xdg-utils: open items in your default browser'
  'mako: Wayland notification daemon for click-to-open notifications (or dunst/swaync)'
)
provides=('gitlab-inbox')
conflicts=('gitlab-inbox')
_dist="gitlab-inbox-${pkgver}-linux-x86_64"
source=("$_dist.tar.gz::$url/releases/download/v${pkgver}/${_dist}.tar.gz")
# sha256 of the release tarball; refresh with `updpkgsums` (pacman-contrib) on
# each new release, then regenerate .SRCINFO.
sha256sums=('7cd0e7f4b3461b4b1fc8ffbb476d898ab544e14321d24a9e6cc8e12718e21c37')

package() {
  cd "$srcdir/$_dist"

  install -Dm755 gitlab-inbox "$pkgdir/usr/bin/gitlab-inbox"

  install -Dm644 icons/32x32.png      "$pkgdir/usr/share/icons/hicolor/32x32/apps/gitlab-inbox.png"
  install -Dm644 icons/128x128.png    "$pkgdir/usr/share/icons/hicolor/128x128/apps/gitlab-inbox.png"
  install -Dm644 icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/gitlab-inbox.png"
  install -Dm644 icons/icon.png       "$pkgdir/usr/share/icons/hicolor/512x512/apps/gitlab-inbox.png"
  install -Dm644 icons/logo.svg       "$pkgdir/usr/share/icons/hicolor/scalable/apps/gitlab-inbox.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/gitlab-inbox.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=GitLab Inbox
GenericName=GitLab review inbox
Comment=A glanceable desktop inbox for GitLab things that need your reply
Exec=gitlab-inbox
Icon=gitlab-inbox
Terminal=false
Categories=Development;RevisionControl;Utility;
Keywords=gitlab;glab;merge request;review;inbox;
StartupWMClass=gitlab-inbox
EOF
}
