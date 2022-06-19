# Maintainer: steffeno <steffeno dash etc at protonmail dot com>

EXTENSION_NAME='ghidra2dwarf'
pkgname="ghidra-extension-$EXTENSION_NAME"
pkgver='1.0'
pkgrel='1'
pkgdesc='Ghidra plugin to export information from ghidra to dwarf sections inside ELF binaries'
arch=('any')
url="https://github.com/cesena/$EXTENSION_NAME"
license=('MIT')
depends=('python' 'ghidra')
source=("$EXTENSION_NAME.zip::$url/releases/download/latest/ghidra2dwarf.zip")
sha512sums=('23e43ce0bbc0ba6667f6647a896b75c951f9031fd050a0512f6b0c498f4ade7295d41377a7559b63d5a9d47a30d4e123b794717b093f42bfb5e6982c3a41895f')

[ -z $GHIDRA_HOME ] && GHIDRA_HOME='/opt/ghidra'
_subdir="Ghidra/Extensions/$EXTENSION_NAME"
INSTALL_DIR="$GHIDRA_HOME/$_subdir"
_extension_files=('libdwarf.jar' 'elf.py' 'ghidra2dwarf.py')

backup=()
for file in "${_extension_files[@]}"; do
    backup+=("${INSTALL_DIR/\//}/$file")
done

package() {
    for file in "${_extension_files[@]}"; do
        install -D -m644 "$srcdir/$EXTENSION_NAME/$file" "$pkgdir/$INSTALL_DIR/$file"
    done

    msg "Remember to add the script's directory ($INSTALL_DIR) by choosing 'Display Script Manager' -> 'Manage Script Directories' -> 'Display file chooser to add bundles to list'"
}
