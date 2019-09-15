# Maintainer: Ankit R Gadiya <arch@argp.in>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=jekyll-sitemap
pkgname=ruby-jekyll-sitemap
pkgver=1.3.1
pkgrel=1
pkgdesc="Automatically generate a sitemap.xml for your Jekyll site."
arch=('any')
depends=('ruby' 'jekyll')
url="https://rubygems.org/gems/jekyll-sitemap"
noextract=("jekyll-sitemap-${pkgver}.gem")
license=('MIT')
source=("https://rubygems.org/downloads/jekyll-sitemap-${pkgver}.gem")
sha256sums=('b528e0bbd6eb3d4906b9df5fc3ad33d4710b615990f5309e22629d61d7c67c34')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "jekyll-sitemap-${pkgver}.gem"
    rm "${pkgdir}/${_gemdir}/cache/jekyll-sitemap-${pkgver}.gem"

    install -D -m644 "${pkgdir}/${_gemdir}/gems/jekyll-sitemap-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix Compress Error
    rm "${pkgdir}/${_gemdir}/gems/jekyll-sitemap-${pkgver}/spec/fixtures/_posts/"2016-*.html
}
