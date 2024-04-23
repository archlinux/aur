# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Jan Magnus Brevik <janmbrevik@gmail.com>
# Contributor: Rubén Fdes Moreira <tmp-meteque@openmailbox.com>
# Contributor: Sigmund Vestergaard <sigmundv@gmail.com>
# Contributor: MacCyber <jonas.enge@gmail.com>
# Contributor: Doug Newgard <scimmia22@outlook.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Antti Hautaniemi <an7oine@me.com>

_pyver=3.10
_ubuntuver=22.04
pkgname=acestream-engine
pkgver=3.2.3
pkgrel=1
pkgdesc="Ace Stream engine"
arch=("x86_64")
url="https://acestream.org"
license=("custom:ACE Stream")
depends=(
  python310
)
makedepends=(
  python-installer
)
optdepends=(
  "pygtk: GTK+ gui support"
)
backup=("usr/lib/$pkgname/acestream.conf")
install="$pkgname.install"
source=(
  "$pkgname-$pkgver.tar.gz::https://download.acestream.media/linux/acestream_${pkgver}_ubuntu_${_ubuntuver}_x86_64_py${_pyver}.tar.gz"
  "https://files.pythonhosted.org/packages/00/2e/800365d138ef6b3036ef40e78dea88b7b02f6e85399fb5b85a2de9a095c8/apsw-3.45.3.0-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
  "https://files.pythonhosted.org/packages/c9/7c/43d81bdd5a915923c3bad5bb4bff401ea00ccc8e28433fb6083d2e3bf58e/cffi-1.16.0-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
  "https://files.pythonhosted.org/packages/61/8a/a0a71720da1c61fd6a55a1962ec1280cebc4552c319efe744c8aa99d28c5/lxml-5.2.1-cp310-cp310-manylinux_2_28_x86_64.whl"
  "https://files.pythonhosted.org/packages/ee/87/f1bb6a595f14a327e8285b9eb54d41fef76c585a0edef0a45f6fc95de125/PyNaCl-1.5.0-cp36-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.manylinux_2_24_x86_64.whl"
  "https://files.pythonhosted.org/packages/af/20/5f29ec45462360e7f61e8688af9fe4a0afae057edfabdada662e11bf97e7/pycryptodome-3.20.0-cp35-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
  "https://files.pythonhosted.org/packages/f7/29/13965af254e3373bceae8fb9a0e6ea0d0e571171b80d6646932131d6439b/setuptools-69.5.1-py3-none-any.whl"
  "$pkgname.desktop"
  "$pkgname.service"
  "LICENSE"
)
noextract=(
  "apsw-3.45.3.0-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
  "cffi-1.16.0-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
  "lxml-5.2.1-cp310-cp310-manylinux_2_28_x86_64.whl"
  "PyNaCl-1.5.0-cp36-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.manylinux_2_24_x86_64.whl"
  "pycryptodome-3.20.0-cp35-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
  "setuptools-69.5.1-py3-none-any.whl"
)
sha256sums=('ad11060410c64f04c8412d7dc99272322f7a24e45417d4ef2644b26c64ae97c9'
            'c4400eaf60ab9bb33b998e81fbc404bcba5aecefc59bf7e4e5a17ea39c4b82cd'
            'e4108df7fe9b707191e55f33efbcb2d81928e10cea45527879a4749cbe472614'
            'a2b44bec7adf3e9305ce6cbfa47a4395667e744097faed97abb4728748ba7d47'
            '0c84947a22519e013607c9be43706dd42513f9e6ae5d39d3613ca1e142fba44d'
            '76cb39afede7055127e35a444c1c041d2e8d2f1f9c121ecef573757ba4cd2c3c'
            'c636ac361bc47580504644275c9ad802c50415c7522212252c033bd15f301f32'
            '930ba23b7d94487d51c2b43203922467ae254981d00992337ab9a057c5e0f804'
            'a0b657b00e8cedc69d24d28591c478d5b4c3443ed1a2796f3c606ae6635cbd89'
            'da210a9270403957864ec5c77b727bdd6d7186035af6b38c1cc74e2c6f193585')

_libsymlinks() {
  ln -sf "/usr/lib/$pkgname/lib/lib$1.so.$2.$3" "$pkgdir/usr/lib/$pkgname/lib/lib$1.so"
  ln -sf "/usr/lib/$pkgname/lib/lib$1.so.$2.$3" "$pkgdir/usr/lib/$pkgname/lib/lib$1.so.$2"
}

package() {
  sed -i "/ROOT=/c\ROOT=\/usr/lib\/${pkgname}" "start-engine"

  install -Dm755 "start-engine"                "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "acestream.conf"              "$pkgdir/usr/lib/$pkgname/acestream.conf"
  install -Dm755 "acestreamengine"             "$pkgdir/usr/lib/$pkgname/acestreamengine"
  cp -a "data"                                 "$pkgdir/usr/lib/$pkgname/"
  cp -a "lib"                                  "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 "data/images/streamer-32.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "LICENSE"          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  ln -sf "/usr/bin/$pkgname" "$pkgdir/usr/bin/acestreamengine"

  _libsymlinks "avcodec"   "58" "100.100"
  _libsymlinks "avdevice"  "58" "11.101"
  _libsymlinks "avfilter"   "7" "87.100"
  _libsymlinks "avformat"  "58" "51.100"
  _libsymlinks "avutil"    "56" "58.100"
  _libsymlinks "fdk-aac"    "2" "0.1"
  _libsymlinks "mp3lame"    "0" "0.0"
  _libsymlinks "swresample" "3" "8.100"
  _libsymlinks "swscale"    "5" "8.100"

  ln -sf "/usr/lib/$pkgname/lib/libx264.so.148" "$pkgdir/usr/lib/$pkgname/lib/libx264.so"

  # acestream user
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf" <<END
u acestream - "systemd Ace Stream Service"
END

  # acestream service directory
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf" <<END
d /var/lib/ACEStream 0755 acestream acestream -
END

  python -m installer -d "$pkgdir" --no-compile-bytecode apsw-3.45.3.0-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
  python -m installer -d "$pkgdir" --no-compile-bytecode cffi-1.16.0-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
  python -m installer -d "$pkgdir" --no-compile-bytecode lxml-5.2.1-cp310-cp310-manylinux_2_28_x86_64.whl
  python -m installer -d "$pkgdir" --no-compile-bytecode PyNaCl-1.5.0-cp36-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.manylinux_2_24_x86_64.whl
  python -m installer -d "$pkgdir" --no-compile-bytecode pycryptodome-3.20.0-cp35-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
  python -m installer -d "$pkgdir" --no-compile-bytecode setuptools-69.5.1-py3-none-any.whl

  # ugly hack
  local python_version
  python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  mv "$pkgdir/usr/lib/python$python_version" "$pkgdir/usr/lib/python$_pyver"
}
