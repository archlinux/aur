# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=image_optim
pkgver=0.24.1
pkgrel=0
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
sha512sums=('7b811e1c5b05a98b530e170d5c3e6416f9cd04bd7b650bb19159ceeb371b2edecf65ccfd4aba1e3fddf633a3d783193bdd533a9de4628e90c0bc582c69e19683')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${pkgname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
    install -D -m644 "${pkgdir}/${_gemdir}/gems/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
