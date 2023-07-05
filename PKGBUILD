# Maintainer: Arnaud Joset <info [AT] agayon [DOT] be>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=('sat-tmp-hg')
_realname=sat_tmp
pkgver=0.7.r88.298dac50ca73
_version=0.7
pkgrel=1
pkgdesc="sat_tmp aims to temporary store files needed by Salut-a-toi (sat). These monkey patchs are not merged upstream yet. For now, only wokkel is impacted."
url="https://salut-a-toi.org/"
arch=('any')
depends=('python' 'python-wokkel')
makedepends=('mercurial')
provides=('sat-tmp')
conflicts=('sat-tmp')
license=('AGPL3')
source=("hg+https://repos.goffi.org/sat_tmp")
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd $_realname
  printf "$_version.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd $_realname
  python setup.py build
}

package(){
  cd $_realname
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
