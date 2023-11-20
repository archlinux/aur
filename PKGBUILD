# Maintainer: Alonso Rodriguez <alonso.rodriguez (at) udc.es>
pkgname=acestream-engine-py3
pkgver=3.1.75rc4
pkgrel=1
epoch=
pkgdesc="Latest available Ace Stream Engine, setup via virtualenv with latest working python version"
arch=("x86_64")
url="https://acestream.org"
license=("custom")
groups=()
depends=(
  python38
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=(acestream-engine)
replaces=()
backup=("usr/lib/$pkgname/acestream.conf")
options=()
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://download.acestream.media/linux/acestream_${pkgver}_ubuntu_18.04_x86_64_py3.8.tar.gz"
        "https://files.pythonhosted.org/packages/00/e6/73931df4046e34a6354d323b4a5b5c18e5184f4a08687806ee3353c81a6b/pycryptodome-3.19.0-cp35-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        "https://files.pythonhosted.org/packages/44/1b/0771c38e65ad23e25368b5e07c920054774b8d12477a4fad116bf500de73/lxml-4.9.3-cp38-cp38-manylinux_2_28_x86_64.whl"
        "https://files.pythonhosted.org/packages/eb/aa/1c4bf9641089d9286773b0d309b229b49bfb2a0bcb196b1bbfc142d2c87f/apsw-3.44.0.0-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        "https://files.pythonhosted.org/packages/19/06/4e3fa3c1b79271e933c5ddbad3a48aa2c3d5f592a0fb7c037f3e0f619f4d/psutil-5.9.6-cp36-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        "https://files.pythonhosted.org/packages/ee/87/f1bb6a595f14a327e8285b9eb54d41fef76c585a0edef0a45f6fc95de125/PyNaCl-1.5.0-cp36-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.manylinux_2_24_x86_64.whl"
        "https://files.pythonhosted.org/packages/6c/0c/f37b6a241f0759b7653ffa7213889d89ad49a2b76eb2ddf3b57b2738c347/iso8601-2.1.0-py3-none-any.whl"
        "https://files.pythonhosted.org/packages/f1/c9/326611aa83e16b13b6db4dbb73b5455c668159a003c4c2f0c3bcb2ddabaf/cffi-1.16.0-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        "https://files.pythonhosted.org/packages/62/d5/5f610ebe421e85889f2e55e33b7f9a6795bd982198517d912eb1c76e1a53/pycparser-2.21-py2.py3-none-any.whl"
		"sysusers.conf"
)
noextract=(
        "pycryptodome-3.19.0-cp35-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        "lxml-4.9.3-cp38-cp38-manylinux_2_28_x86_64.whl"
        "apsw-3.44.0.0-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        "psutil-5.9.6-cp36-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        "PyNaCl-1.5.0-cp36-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.manylinux_2_24_x86_64.whl"
        "iso8601-2.1.0-py3-none-any.whl"
        "cffi-1.16.0-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        "pycparser-2.21-py2.py3-none-any.whl"
)
sha256sums=(
        "6d4947dffad58754a6de725d49f8f9a574931c13c293eb4c9c3f324e93ba8356"
        "e249a784cc98a29c77cea9df54284a44b40cafbfae57636dd2f8775b48af2434"
        "6fc3c450eaa0b56f815c7b62f2b7fba7266c4779adcf1cece9e6deb1de7305ce"
        "c034356642368b7a030361b47f9188af5e12e1dec1caf5e45bea2c72b28cecc4"
        "748c9dd2583ed86347ed65d0035f45fa8c851e8d90354c122ab72319b5f366f4"
        "0c84947a22519e013607c9be43706dd42513f9e6ae5d39d3613ca1e142fba44d"
        "aac4145c4dcb66ad8b648a02830f5e2ff6c24af20f4f482689be402db2429242"
        "6602bc8dc6f3a9e02b6c22c4fc1e47aa50f8f8e6d3f78a5e16ac33ef5fefa324"
        "8ee45429555515e1f6b185e78100aea234072576aa43ab53aefcae078162fca9"
		"dd0091a54c435a57a658f29b8675dfdc840e2d07cd05d41e87482a2c3ae331da"
)

# prepare() {
#     # Nothing to do here for the time being    
# }

build() {
    cd "$srcdir"

    python3.8 -m venv .
    bin/pip3.8 --disable-pip-version-check install ./*.whl
    source bin/activate
    echo THIS WORKS! $(which python)
}

package() {
    cd "$srcdir"
    
	# Change the launcher script
    sed -i "/ROOT=/c\ROOT=\/usr/lib\/${pkgname}" "start-engine"
    sed -i "s@LD_LIBRARY_PATH=@PYTHONPATH=\${ROOT}/lib/python3.8/site-packages/ LD_LIBRARY_PATH=@g" "start-engine"
    sed -i "s@${ROOT}/acestreamengine@${ROOT}/acestream-engine-py3@g" "start-engine"

    install -Dm755 "start-engine"                "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "acestream.conf"              "$pkgdir/usr/lib/$pkgname/acestream.conf"
    install -Dm755 "acestreamengine"             "$pkgdir/usr/lib/$pkgname/acestreamengine"
    cp -a "data"                                 "$pkgdir/usr/lib/$pkgname/"
    cp -a "lib"                                  "$pkgdir/usr/lib/$pkgname/"
    install -Dm644 "data/images/streamer-32.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "LICENSE"          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
