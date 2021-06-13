# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ruby-vimgolf
_gemname=vimgolf
pkgver=0.5.0
pkgrel=3
provides=('vimgolf')
conflicts=('python-vimgolf')
pkgdesc='Real Vim ninjas count every keystroke - do you?'
arch=('any')
url='https://github.com/igrigorik/vimgolf'
license=('MIT')
depends=('ruby'
         'ruby-thor'
         'ruby-json_pure'
         'ruby-highline')
source=(
    "https://rubygems.org/downloads/${_gemname}-$pkgver.gem"
    "https://github.com/igrigorik/vimgolf/raw/v$pkgver/LICENSE"
)
sha256sums=('de6a20eb67e0558b0d749b13d8b2e12a7fa649bdb683e1a489a441bd27fe0da4'
            '07e5c5ff6d7a5f5dbb39f882d89afe38e0e4e60d3302a80e47876a07be70b4b1')
noextract=("${_gemname}-$pkgver.gem")
options=(!emptydirs)

package() {
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    local _gemdir="$(ruby -e 'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/${_gemdir}" -n "$pkgdir/usr/bin" ${_gemname}-$pkgver.gem
    rm "$pkgdir/${_gemdir}/cache/${_gemname}-$pkgver.gem"
}
