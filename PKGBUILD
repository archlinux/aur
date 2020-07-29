# Maintainer: Sainnhe Park <sainnhe@gmail.com>
_variant='vim'
_extname=coc-python
_packdir="usr/share/vim/vimfiles/pack/coc/start/${_extname}"
url='https://github.com/neoclide/coc-python'
pkgdesc='Python extension for coc.nvim'

pkgname="${_variant}-${_extname}-git"
provides=("${_variant}-${_extname}")
conflicts=("${_variant}-${_extname}")
arch=('any')
depends=("${_variant}-coc")
optdepends=('python-jedi: jedi intellisense engine support'
            'anaconda: anaconda support'
            'python-pipenv: pipenv support'
            'python-poetry: poetry support'
            'python-isort: isort support'
            'ctags: ctags support'
            'autopep8: autopep8 formatting plugin'
            'python-black: black formatting plugin'
            'yapf: yapf formatting plugin'
            'flake8: flake8 linting plugin'
            'bandit: bandit linting plugin'
            'mypy: mypy linting plugin'
            'python-pep8: pep8 linting plugin'
            'python-prospector: prospector linting plugin'
            'python-pydocstyle: pydocstyle linting plugin'
            'pylama: pylama linting plugin'
            'python-pylint: pylint linting plugin')
makedepends=('yarn' 'npm' 'git')
license=('')
source=("${_extname}::git+${url}.git")
pkgver=1.2.12.r2.g241c6b3
pkgrel=1
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_extname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_extname}"
    yarn install --frozen-lockfile
    yarn pack
    tar xvf *.tgz
    rm *.tgz
    cd package
    npm install --only=production --no-lockfile --ignore-scripts
}

package() {
    cd "${srcdir}/${_extname}/package"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    rm -rf "${srcdir}/${_extname}/package"
}
