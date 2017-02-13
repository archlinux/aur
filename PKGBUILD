# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname='undistract-me-git'
pkgver='r58.3c3054c'
pkgrel=2

arch=('any')
url="https://github.com/jml/undistract-me"
depends=('bash')
optdepends=('zsh')
conflicts=('undistract-me')
licenseURL="https://raw.githubusercontent.com/jml/undistract-me/master/LICENSE"
license=("custom","$licenseURL")
pkgdesc="Notifies you when long-running terminal commands complete"
source=("git+https://github.com/jml/undistract-me.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/usr/share/undistract-me"

  cp "$srcdir/${pkgname%-git}/"{*.bash,*.sh} "$pkgdir/usr/share/undistract-me"

  install -D -m644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}

post_install() {
  echo "Don't forget to add \`source /usr/share/undistract-me/long-running.bash;notify_when_long_running_commands_finish_install\` to your .bashrc or .zshrc"
  echo "You can do this automatically via the following command:"
  echo "echo \"source /usr/share/undistract-me/long-running.bash\\\nnotify_when_long_running_commands_finish_install\" >> .bashrc"
  echo "Or (for zsh):"
  echo "echo \"source /usr/share/undistract-me/long-running.bash\\\nnotify_when_long_running_commands_finish_install\" >> .zshrc"
}
