_gitname="camisole"
pkgname=camisole-git
pkgver=0.1.r5.gea9e996
pkgrel=1
pkgdesc="An asyncio-based source compiler and test runner."
arch=('any')
url="https://bitbucket.org/prologin/${_gitname}"
license=('GPL')
conflits=('camisole')
depends=('python' 'python-aiohttp' 'isolate-git')
makedepends=('git' 'python-setuptools')
optdepends=('esotope-bfc-git: compile Brainfuck sources'
            'fpc: compile Pascal sources'
            'fsharp: compile FSharp sources'
            'gambit-c: compile Scheme sources'
            'gcc: compile C, CXX sources'
            'gcc-ada: compile Ada sources'
            'ghc: compile Haskell sources'
            'jdk8-openjdk: compile Java sources'
            'luajit: compile Lua sources'
            'mono: compile CSharp, FSharp, VisualBasic sources'
            'mono-basic: compile VisualBasic sources'
            'nodejs: compile Javascript sources'
            'ocaml: compile OCaml sources'
            'perl: compile Perl sources'
            'php: compile PHP sources')
source=("git+${url}.git"
        'camisole.service'
        'sysusers.conf')
sha1sums=('SKIP'
          '29fc46a441a1c75cc635ed209bde983d2a61d696'
          '52da2781a8d90d00d2d78b02f6e593340191de84')
install=${pkgname}.install

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_gitname}"
    python setup.py install --root="${pkgdir}" || return 1
    install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_gitname}.conf"
    install -Dm644 "${srcdir}/camisole.service" "${pkgdir}/usr/lib/systemd/system/${_gitname}.service"
}
