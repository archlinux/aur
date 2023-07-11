pkgname=cosmonium-git
_pkgname=cosmonium
pkgver=v0.3.0.dev581.161.gf6c3458
pkgrel=1
pkgdesc="3D astronomy and space exploration program"
arch=('x86_64')
url="https://github.com/cosmonium/cosmonium"
license=('GPL3')
depends=()
makedepends=('python-numpy' 'panda3d')
conflicts=('cosmonium-bin')
options=('!libtool')
source=("git+https://github.com/cosmonium/cosmonium.git"
        "git+https://github.com/cosmonium/P3DModuleBuilder.git"
        "git+https://github.com/cosmonium/cosmonium-data.git"
        "git+https://github.com/cosmonium/cefpanda.git"
        "git+https://github.com/cosmonium/panda3d-gltf.git"
        "git+https://github.com/cosmonium/TabbedFrame.git"
        "git+https://github.com/cosmonium/DirectGui-layout-system.git"
        "git+https://github.com/cosmonium/DirectFolderBrowser.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd ${_pkgname}
	git describe --always | sed 's/-/./g'
}

prepare() {
  cd "$srcdir"/$_pkgname
  git submodule init
  git config submodule.tools/p3d_module_builder.url		"${srcdir}/P3DModuleBuilder"
  git config submodule.data.url					"${srcdir}/cosmonium-data"
  git config submodule.third-party/cefpanda.url			"${srcdir}/cefpanda"
  git config submodule.third-party/gltf.url			"${srcdir}/panda3d-gltf"
  git config submodule.third-party/tabbedframe.url		"${srcdir}/TabbedFrame"
  git config submodule.third-party/directguilayout.url		"${srcdir}/DirectGui-layout-system"
  git config submodule.third-party/directfolderbrowser.url	"${srcdir}/DirectFolderBrowser"
  git -c protocol.file.allow=always submodule update
  ls -lah data

}
build() {
  cd "$srcdir"/$_pkgname
  make
}

package() {
  cd "$srcdir"/$_pkgname
  make DESTDIR="$pkgdir" install
}

