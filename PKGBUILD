# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=image_optim
pkgver=0.26.1
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
sha512sums=('c575a8abe94f7f61c064d8d5e259ed7a8cf8d1219b11123e5bda2a4ba5e0c8ef4d39f38f14a6fe243a0250f5457415c817d5ea5bfa1478905cc185e19f97041f')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${pkgname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
    install -D -m644 "${pkgdir}/${_gemdir}/gems/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
