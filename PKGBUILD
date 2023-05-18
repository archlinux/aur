# Maintainer: XavierCLL <xavier.corredor.llano at gmail.com>
# Contributor: MikeBreytenbach <mike.breyten.bach at gmail dot com>
# Contributor: edacval
# Contributor: Ethan Reece <aur at ethanreece dot com>

pkgname=pycharm-professional
pkgver=2023.1.2
pkgrel=1
pkgdesc="Python IDE for Professional Developers. Professional Edition"
arch=('x86_64' 'aarch64')
url='https://www.jetbrains.com/pycharm/'
conflicts=('pycharm' 'pycharm-community-edition' 'pycharm-community-jre' 'pycharm-community-eap' 'pycharm-eap' 'pycharm-community-jre-aarch64')
provides=('pycharm')
license=('custom')
backup=("opt/$pkgname/bin/pycharm64.vmoptions"
        "opt/$pkgname/bin/idea.properties")
depends=('giflib' 'glibc' 'sh' 'libxtst' 'libxslt' 'libxss' 'nss' 'python' 'libdbusmenu-glib')
options=('!strip')
source_x86_64=("https://download.jetbrains.com/python/$pkgname-$pkgver.tar.gz")
source_aarch64=("https://download.jetbrains.com/python/$pkgname-$pkgver-aarch64.tar.gz")
source=("pycharm-professional.desktop"
        "ltedit.desktop")
sha256sums=('a75264959b06a45ea0801729bc1688bfbd52da3c5fbf3d5b1ad9267860439291'
            '41f0e64dc7ec5ab85e7b0df1dc8237b56c94ccf9e4f2fa033eaadcc7756df3d3')
sha256sums_x86_64=('e57eae7a3c99983b8dc5c5aa036579d7ac73cae33aeb4c5f7f80517f2040c385')
sha256sums_aarch64=('1ca333d6ffa13c882f4943f9e273e1948a3ce4c48f0ff4a5d416cb7efccff988')
makedepends=('python-setuptools' 'cython')
optdepends=('ipython: For enhanced interactive Python shell inside Pycharm'
            'openssh: For deployment and remote connections'
            'python-setuptools: Packages manager for Python, for project interpreter'
            'python-coverage: For support code coverage measurement'
            'cython: For performance debugger'
            'docker-machine: For support docker inside Pycharm'
            'docker-compose: For support docker inside Pycharm'
            'vagrant: For support virtualized development environments'
            'python-pytest: For support testing inside Pycharm'
            'python-tox: Python environments for testing tool'
            'jupyter-server: For Jupyter notebooks and apps')
            
# build() {
#     # clean up and compile PyDev debugger used by PyCharm to speedup debugging
#     find pycharm-${pkgver}/plugins/python/helpers/pydev/ \( -name *.so -o -name *.pyd \) -delete
#     python pycharm-${pkgver}/plugins/python/helpers/pydev/setup_cython.py build_ext --inplace --force-cython
#     
#     # for attach debugger
#     pushd pycharm-${pkgver}/plugins/python/helpers/pydev/pydevd_attach_to_process/linux_and_mac
#     if [[ $CARCH == "x86_64" ]]; then
#         g++ -m64 -shared -o ../attach_linux_amd64.so -fPIC -nostartfiles attach.cpp
#     elif [ "${CARCH}" == "aarch64" ]; then
#         g++ -march=armv8-a+crypto -shared -o ../attach_linux_amd64.so -fPIC -nostartfiles attach.cpp
#     fi
#     popd
# 
#     rm -rf pycharm-${pkgver}/plugins/python/helpers/pydev/build/
#     find pycharm-${pkgver}/plugins/python/helpers/pydev/ -name __pycache__ -exec rm -rf {} \;
# }

package() {
    # licenses
    install -dm 755 "$pkgdir/usr/share/licenses/$pkgname/"
    install -m 644 "pycharm-$pkgver/license/"* "$pkgdir/usr/share/licenses/$pkgname/"
    
    # base
    install -dm 755 "$pkgdir/opt/$pkgname"
    mv "pycharm-$pkgver/"* "$pkgdir/opt/$pkgname/"
    install -dm 755 "$pkgdir/usr/share/applications"
    install -Dm 644 "$pkgname.desktop" "$pkgdir/usr/share/applications/"
    install -Dm 644 ltedit.desktop "$pkgdir/usr/share/applications/"
    install -dm 755 "$pkgdir/usr/share/icons/hicolor/"{128x128,scalable}"/apps/"
    install -Dm 644 "$pkgdir/opt/$pkgname/bin/pycharm.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/pycharm.png"
    install -Dm 644 "$pkgdir/opt/$pkgname/bin/pycharm.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/pycharm.svg"

    # exec
    install -dm 755 "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/bin/pycharm.sh" "$pkgdir/usr/bin/pycharm"
    ln -s "/opt/$pkgname/bin/ltedit.sh" "$pkgdir/usr/bin/ltedit"

}
