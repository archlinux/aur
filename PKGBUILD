# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname="python2-ldns"
pkgver=1.6.17
pkgrel=1
pkgdesc="Python bindings for the ldns library for DNS programming (Ubuntu repackage)"
url="https://www.nlnetlabs.nl/projects/ldns/"
arch=('x86_64' 'i686')
license=('BSD')
depends=("python2" "ldns")
makedepends=("deb2targz" "python2-setuptools")
# as there are problems building from source, we use ubuntu packages in the meantime
source_x86_64=("http://ftp.osuosl.org/pub/ubuntu/pool/universe/l/ldns/python-ldns_1.6.17-5_amd64.deb" "setup.py")
md5sums_x86_64=('63dca2552e87f3c32148bdaccd1e3d20'
                '4a96c66b37f26b6d5231c6466cd6503f')
md5sums_i686=('e8ab989ff369d3b330896ee578c4fcd2'
              '4a96c66b37f26b6d5231c6466cd6503f')
source_i686=("http://ftp.osuosl.org/pub/ubuntu/pool/universe/l/ldns/python-ldns_1.6.17-5_i386.deb" "setup.py")
if [[ $CARCH == "x86_64" ]]
then
    noextract=("python-ldns_1.6.17-5_amd64.deb")
else
    noextract=("python-ldns_1.6.17-5_i386.deb")
fi

prepare() {
    cd "${srcdir}"
    if [[ $CARCH == "x86_64" ]]
    then
        deb2targz python-ldns_1.6.17-5_amd64.deb
        tar xf python-ldns_1.6.17-5_amd64.tar.xz ./usr/lib/python2.7/dist-packages/ldns.py
    else
        deb2targz python-ldns_1.6.17-5_i686.deb
        tar xf python-ldns_1.6.17-5_i686.tar.xz ./usr/lib/python2.7/dist-packages/ldns.py
    fi
    mv usr/lib/python2.7/dist-packages/ldns.py .
    rm -rf usr # thats why you NEVER may run makepkg as root!
}

package() {
    cd "${srcdir}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
