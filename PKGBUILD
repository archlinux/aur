_basepgkname=llamafile
pkgname="${_basepgkname}-git"
pkgver=0.8.9.r454.b3930aa
pkgrel=1
pkgdesc="Distribute and run LLMs with a single file."
arch=('x86_64')
url="https://github.com/Mozilla-Ocho/llamafile"
license=('Apache-2.0')
makedepends=('unzip' 'fakeroot')
optdepends=(
	'hip-runtime-amd: Used for static compiling with rocm'
  'hipblas: Used for static compiling with rocm'
  'rocminfo: Used for verifying existance of rocm'
	'cuda: Used for static/dynaimc compiling with rocm Nvidia'
	)
source=(    "${pkgname}::git+https://github.com/Mozilla-Ocho/llamafile"
       )

sha256sums=(
            'SKIP'
           )

provides=(  
            'llamafile'
            'llamafile-bench'
            'llamafile-imatrix'
            'llamafile-convert'
            'llamafile-perplexity'
            'llamafile-quantize'
            'llamafile-tokenize'
            'llava-quantize'
            'llamafile-upgrade-engine'
            'zipalign'
        )
conflicts=('llamafile' 'llamafile-bin' 'android-sdk-build-tools' 'zipalign')
options=(!strip)

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "%s.r%s.%s" "$(git describe --tags | cut -d'-' -f1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  # export CFLAGS=""
  # export LTOFLAGS=""  
  # export CXXFLAGS=""
  # export LDFLAGS=""
  sudo make install MODE=x86_64 PREFIX="${pkgdir}/usr"
}
