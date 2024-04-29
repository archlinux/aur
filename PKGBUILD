_basepgkname=llamafile
pkgname="${_basepgkname}-bin"
pkgver=0.8.1
pkgrel=6
pkgdesc="Distribute and run LLMs with a single file."
arch=('x86_64')
url="https://github.com/Mozilla-Ocho/llamafile"
license=('Apache-2.0')
depends=('cosmopolitan-bin')
optdepends=(
	'hip-runtime-amd: AMD GPU-Offloading Support'
  'hipblas: Used for static compiling with rocm'
  'rocminfo: Used for verifying existance of rocm'
	'cuda: Nvidia GPU-Offloading Support'
	)
source=(    "${pkgname}::https://github.com/Mozilla-Ocho/llamafile/releases/download/${pkgver}/llamafile-${pkgver}.zip"
            'llamafile.sh'
       )

sha256sums=(
            '4d36ab5f2fd7bc488c437732fba9943df1e0bb1370b76fa7a3161e817bbdbce8'
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
            # 'zipalign'
        )
conflicts=('llamafile-git')
options=(!strip)



package() {

  # Install shell script helper
  install -Dm755 "llamafile.sh" "${pkgdir}/usr/bin/llamafile.sh"


  cd "${srcdir}"

  # Install binaries
  install -Dm755 "${_basepgkname}-${pkgver}/bin/llamafile" "${pkgdir}/usr/bin/${_basepgkname}"
  install -Dm755 "${_basepgkname}-${pkgver}/bin/llamafile-tokenize" "${pkgdir}/usr/bin/${_basepgkname}-tokenize"
  install -Dm755 "${_basepgkname}-${pkgver}/bin/llamafile-convert" "${pkgdir}/usr/bin/${_basepgkname}-convert"
  install -Dm755 "${_basepgkname}-${pkgver}/bin/llava-quantize" "${pkgdir}/usr/bin/llava-quantize"
  install -Dm755 "${_basepgkname}-${pkgver}/bin/llamafile-imatrix" "${pkgdir}/usr/bin/${_basepgkname}-imatrix"
  install -Dm755 "${_basepgkname}-${pkgver}/bin/llamafile-quantize" "${pkgdir}/usr/bin/${_basepgkname}-quantize"
  install -Dm755 "${_basepgkname}-${pkgver}/bin/llamafile-perplexity" "${pkgdir}/usr/bin/${_basepgkname}-perplexity"
  # install -Dm755 "${_basepgkname}-${pkgver}/bin/zipalign" "${pkgdir}/usr/bin/zipalign"

  # Install man pages
  install -Dm644 "${_basepgkname}-${pkgver}/share/man/man1/llamafile.1" "${pkgdir}/usr/share/man/man1/${_basepgkname}.1"
  install -Dm644 "${_basepgkname}-${pkgver}/share/man/man1/llava-quantize.1" "${pkgdir}/usr/share/man/man1/llava-quantize.1"
  install -Dm644 "${_basepgkname}-${pkgver}/share/man/man1/llamafile-imatrix.1" "${pkgdir}/usr/share/man/man1/${_basepgkname}-imatrix.1"
  install -Dm644 "${_basepgkname}-${pkgver}/share/man/man1/llamafile-quantize.1" "${pkgdir}/usr/share/man/man1/${_basepgkname}-quantize.1"
  install -Dm644 "${_basepgkname}-${pkgver}/share/man/man1/llamafile-perplexity.1" "${pkgdir}/usr/share/man/man1/${_basepgkname}-perplexity.1"
  install -Dm644 "${_basepgkname}-${pkgver}/share/man/man1/zipalign.1" "${pkgdir}/usr/share/man/man1/zipalign.1"
}