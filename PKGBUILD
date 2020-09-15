# Maintainer: Sholum <wallyssonryu@gmail.com>
pkgname='manim-git'
_pkgname='manim'
pkgver=0.1.11.r5.g9174ec33
pkgrel=1
pkgdesc="Animation engine for explanatory math videos"
arch=('any')
url="https://github.com/3b1b/manim"
license=('MIT' 'custom:3Blue1Brown LLC')
depends=('python'
         'cairo' 
         'ffmpeg' 
         'sox')
makedepends=('git' 
             'python-pip')
optdepends=('texlive-bin: latex support'
            'texlive-core: latex support'
            'texlive-latexextra: latex support'
            'texlive-bibtexextra: latex support'
            'tllocalmgr-git: latex support')
source=('manim::git+https://github.com/3b1b/manim.git')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${_pkgname}"
	
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  python -m pip install -r "${srcdir}/${_pkgname}/requirements.txt"
  python ./setup.py install --root="${pkgdir}" --optimize=1
}
