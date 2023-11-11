# Maintainer: dakataca <🐬dakataca@gmail.com>
# Contributor: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=deemix-py
_name=deemix
pkgver=3.6.6
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://pypi.org/project/deemix/'
license=('GPL3')
depends=(
    'python>=3.7' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-setuptools'
    'python-requests' 'python-deezer-py>=1.3.0' 'python-spotipy>=2.11.0'
)
conflicts=('deemix' 'deemix-git')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c446a1cc0d4f22b18f7e79ce72e5d02d5429495394164ebfd2ff5588b8160b09')
b2sums=('812552c0fd09af02c5c60e00132dca0166faae9235721c536ffd05d30df99bb83f621da494c8c45e6b765cc0f9c43e478db86becbbe910bb58f32ba9d381119b')

pkgver() {
    #cd ${srcdir}/${_name}-${pkgver}
    cd ${_name}-${pkgver}
    #awk -F'"' '/^ +version="[0-9\.]+,/{ print $2}' setup.py | tr -d '\n'
    sed -En 's/^ +version="([0-9\.]+)",$/\1/p' setup.py | tr -d '\n'
}

build() {
    #cd ${srcdir}/${_name}-${pkgver}/
    cd ${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    #cd ${srcdir}/${_name}-${pkgver}/
    cd ${_name}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

## References:
# https://wiki.archlinux.org/title/Python_package_guidelines#Installation_methods
# https://gitlab.com/RemixDev/deemix-py/-/blob/main/setup.py#L26

## Test:
# updpkgsums
# makepkg --printsrcinfo > .SRCINFO
# git clean -dfx

# 👤 Autor: https://t.me/dakataca 💻 🐬 #
