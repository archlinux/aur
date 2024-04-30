_basepgkname=llamafile
pkgname="${_basepgkname}-git"
pkgver=0.8.1
pkgrel=1
pkgdesc="Distribute and run LLMs with a single file."
arch=('x86_64')
url="https://github.com/Mozilla-Ocho/llamafile"
license=('Apache-2.0')
makedepends=('unzip' 'fakeroot' 'cosmopolitan-bin')
optdepends=(
	'hip-runtime-amd: Used for static compiling with rocm'
  'hipblas: Used for static compiling with rocm'
  'rocminfo: Used for verifying existance of rocm'
	'cuda: Nvidia GPU-Offloading Support'
	)
source=(    "${pkgname}::git+https://github.com/Mozilla-Ocho/llamafile"
            'llamafile.sh'
       )

sha256sums=(
            'SKIP'
            'ac0866bd4bbd3d7d4c56fc735adedca5cc0a262d1ab0ef9291fd07db084acdfc'
           )

provides=(  
            'llamafile.sh'
            'llamafile'
            'llamafile-tokenize'
            'llamafile-convert'
            'llava-quantize'
            'llamafile-imatrix'
            'llamafile-quantize'
            'llamafile-perplexity'
            'zipalign'
        )
conflicts=('llamafile' 'llamafile-bin')
options=(!strip)



package() {

  # Install shell script helper
  install -Dm755 "llamafile.sh" "${pkgdir}/usr/bin/llamafile.sh"


  cd "${srcdir}/${pkgname}"
  export CFLAGS=""
  export LTOFLAGS=""  
  export CXXFLAGS=""
  export LDFLAGS=""
  sudo make install MODE=755 PREFIX="${pkgdir}/usr"
}