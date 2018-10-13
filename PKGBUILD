# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=image_optim
pkgver=0.26.3
pkgrel=1
pkgdesc='Optimize (lossless compress, optionally lossy) images (jpeg, png, gif, svg) using external utilities.'
arch=('any')
url='https://github.com/toy/image_optim'
license=('MIT')
depends=('advancecomp'
         'gifsicle'
         'jhead'
         'jpeg-archive'
         'jpegoptim'
         'libjpeg-turbo'
         'nodejs-svgo'
         'optipng'
         'pngcrush'
         'pngout'
         'pngquant'
         'ruby-exifr'
         'ruby-fspath'
         'ruby-image_size'
         'ruby-in_threads'
         'ruby-progress')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${pkgname}-${pkgver}.gem")
noextract=("${pkgname}-${pkgver}.gem")
sha512sums=('b0cfafbaa3466148000acef602c14610bcb13bf4e2ac7c653d8980e40111387f44dec4ec187c865ea6eef3a776661f1749cea03e376898ad03d11a004c763ce6')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${pkgname}-${pkgver}.gem
    install -D -m644 "${pkgdir}/${_gemdir}/gems/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
}
