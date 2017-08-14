# maintained by: bartus szczepaniak <aur@bartus.33mail.com>

name=multiedit
files=(MultiEdit_1_0.py)
pkgname=blender-plugin-${name}
pkgver=r11.25ab77b
pkgrel=1
pkgdesc="Blender addon for editing multiple meshes at once."
arch=('any')
url="https://blenderartists.org/forum/showthread.php?339369-MultiEdit-version-1-0-Multiple-Objects-Editing"
license=('GPL')
depends=('blender')
makedepends=('git')
source=("${name}::git+https://github.com/antoni4040/MultiEdit-Addon.git")
md5sums=('SKIP')

pkgver() {
  cd "$name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${name}
  addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons"
  for file in ${files}
  do
    msg "install -D -m 644 -t ${addons} ${file}"
    file ${file}
    install -D -m 644 -t ${addons} ${file}
  done
}

# vim:set ts=2 sw=2 et:
