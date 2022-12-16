# Maintainer: Komeil Parseh <ahmdparsh129@gmail.com>

pkgname=ruby-repofetch-bin
_gemname=repofetch
pkgver=0.4.1
pkgrel=1
pkgdesc="A remote repository stat fetcher with support for 3rd-party plugins"
arch=("any")
url="https://spenserblack.github.io/repofetch/"
gh_url="https://github.com/spenserblack/repofetch"
license=("MIT")
makedepends=("git")
optdepends=("github-cli: Receive auth token from GitHub")
depends=("ruby")
provides=("ruby-repofetch" "ruby-repofetch-bin")
conflicts=("ruby-repofetch" "ruby-repofetch-bin")
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
md5sums=("fe7b901c2936ae35fb07edc288bb55f7")

package() {
    local _gemdir="$(ruby -e "puts Gem.default_dir")"

    gem install --ignore-dependencies --no-user-install --verbose \
        -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" \
        "$_gemname-$pkgver.gem"

    # copy license into /usr/share/licenses/
    install -Dm644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install --verbose -D --mode=0644 $pkgdir/$_gemdir/gems/$_gemname-$pkgver/*.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"

}
