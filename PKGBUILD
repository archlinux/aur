# Maintainer: Ankit R Gadiya <arch@argp.in>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=jekyll-sitemap
pkgname=ruby-jekyll-sitemap
pkgver=1.2.0
pkgrel=3
pkgdesc="Automatically generate a sitemap.xml for your Jekyll site."
arch=('any')
depends=('ruby' 'jekyll')
url="https://rubygems.org/gems/jekyll-sitemap"
noextract=("jekyll-sitemap-${pkgver}.gem")
license=('MIT')
source=("https://rubygems.org/downloads/jekyll-sitemap-${pkgver}.gem")
sha256sums=('3621d68ef09a4f6f65a0577c01a76e4049aaf566de39bb602719e140b51fc977')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "jekyll-sitemap-${pkgver}.gem"
    rm "${pkgdir}/${_gemdir}/cache/jekyll-sitemap-${pkgver}.gem"

    install -D -m644 "${pkgdir}/${_gemdir}/gems/jekyll-sitemap-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix Compress Error
    rm "${pkgdir}/${_gemdir}/gems/jekyll-sitemap-${pkgver}/spec/fixtures/_posts/"2016-*.html
}
