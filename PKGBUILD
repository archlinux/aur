# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=image_optim
pkgver=0.26.1
pkgrel=3
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
source=("https://rubygems.org/downloads/${pkgname}-${pkgver}.gem"
        'image_optim.gemspec.patch')
noextract=("${pkgname}-${pkgver}.gem")
sha512sums=('c575a8abe94f7f61c064d8d5e259ed7a8cf8d1219b11123e5bda2a4ba5e0c8ef4d39f38f14a6fe243a0250f5457415c817d5ea5bfa1478905cc185e19f97041f'
            'cd429eafaac94feed60b5f68bca519450fdbfaa2d85d6ceefa0fb85d44b951f1ffdec8922e14a4ae28ff5d6483b8e3f2832ca92acd6115bafd12bbc1bc84e7ca')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${pkgname}-${pkgver}.gem
    install -D -m644 "${pkgdir}/${_gemdir}/gems/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"

    patch ../pkg/image_optim/usr/lib/ruby/gems/*/specifications/image_optim-*.gemspec < ../image_optim.gemspec.patch
}
