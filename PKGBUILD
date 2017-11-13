# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=image_optim
pkgver=0.26.0
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
options=('!emptydirs')
source=("https://rubygems.org/downloads/${pkgname}-${pkgver}.gem")
noextract=("${pkgname}-${pkgver}.gem")
sha512sums=('8a58fbb6921501aee3b85eac0480639f875b1bea4f085f56a243ef5b9a190af4192d62c728ec1e9068e0df3816ac1558f67d757ae58c917e18fb896679d68867')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${pkgname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
    install -D -m644 "${pkgdir}/${_gemdir}/gems/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
