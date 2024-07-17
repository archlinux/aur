# Maintainer: Mahor Foruzesh <mahor1221@gmail.com>

pkgname=reddish-shift-bin
_pkgname="${pkgname%-bin}"
pkgver=0.1.2
pkgrel=2
_pkgsrc="$_pkgname-v$pkgver"
pkgdesc="Set color temperature of display according to time of day"
url="https://github.com/mahor1221/reddish-shift"
license=(GPL3)
arch=(x86_64 aarch64)
depends=(gcc-libs glibc)
conflicts=("$_pkgname")
source_aarch64=("$_pkgsrc-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgsrc-aarch64-unknown-linux-gnu.tar.gz")
source_x86_64=("$_pkgsrc-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgsrc-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a7d2652e97dfe1204db782b6077e09155c49fe8dbeffd73e0e8e27bcf9dbe9f4')
sha256sums_aarch64=('802279e81777383842cdd791b03b14a10999cf29c8c566b764fa378fc1240e50')

package() {
    cd "$srcdir"
    install -vDm755 "$_pkgname" -t "$pkgdir/usr/bin/"
    install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
    install -vDm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -vDm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -vDm644 config.toml -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -vDm644 "$_pkgname.service" -t "$pkgdir/usr/lib/systemd/user/"
    cd "$srcdir/completion"
    install -vDm644 "_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    install -vDm644 "$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -vDm644 "$_pkgname.fish" "$pkgdir/usr/share/fish/completions/$_pkgname.fish"
    install -vDm644 "$_pkgname.elv" "$pkgdir/usr/share/elvish/lib/$_pkgname.elv"
    cd "$srcdir/man1"
    find -name '*.1' -exec gzip --keep --force "{}" \;
    find -name '*.1.gz' -exec install -vDm644 "{}" -t "$pkgdir/usr/share/man/man1" \;
}
