# Maintainer: Adrien Smith <adrien@panissupraomnia.dev>
# Contributor: Simon Kohlmeyer <simon.kohlmeyer@googlemail.com>

pkgname=rbenv-git
pkgver=1.2.0.r46.g52acbdf
pkgrel=1
pkgdesc="Simple Ruby version manager"
arch=('any')
url="https://github.com/rbenv/rbenv"
license=('MIT')
depends=('bash')
makedepends=('git')
optdepends=('ruby-build')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="rbenv.install"
source=('git+https://github.com/rbenv/rbenv.git')
sha256sums=('SKIP')


pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname%-git}"

    install -Dm 644 ./LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm 644 -t "$pkgdir/usr/lib/rbenv/completions/" ./completions/*

    install -Dm 755 -t "$pkgdir/usr/lib/rbenv/libexec/" ./libexec/*

    install -d "$pkgdir/usr/bin/"
    ln -s /usr/lib/rbenv/libexec/rbenv "$pkgdir/usr/bin/"

    install -Dm 644 rbenv.d/exec/gem-rehash/rubygems_plugin.rb \
        "$pkgdir/usr/lib/rbenv/hooks/exec/gem-rehash/rubygems_plugin.rb"
    install -m 644 rbenv.d/exec/gem-rehash.bash \
        "$pkgdir/usr/lib/rbenv/hooks/exec/gem-rehash.bash"
}
