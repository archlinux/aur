# Contributor: Dylan D'Arcy <dylan.somebody at gmail dot com>

pkgname=epsxe-plugin-gpu-soft
pkgver=1.18
pkgrel=2
pkgdesc="Software GPU Plugin"
arch=('i686' 'x86_64')
url="http://www.pbernert.com/"
license=('custom')
depends=('epsxe')
source=("http://www.pbernert.com/gpupeopssoftx118.tar.gz"
        "http://www.pbernert.com/petegpucfg_V2-9_V1-77_V1-18.tar.gz")
md5sums=('0a92e9caad7858b616a88006be66492d'
         '7519c476a1eb28572ba6b49e82b15c5d')

package() {
    cd "$srcdir"
    rename peops_soft_readme_"${pkgver//./_}".txt README peops_soft_readme_"${pkgver//./_}".txt
    rename peops_soft_version_"${pkgver//./_}".txt changelog peops_soft_version_"${pkgver//./_}".txt

    rm -f "$srcdir"/cfg/cfgPete{MesaGL,XGL2}

    install -d "$pkgdir"/opt/epsxe/{cfg,plugins}
    install -t "$pkgdir"/opt/epsxe/cfg $(find ./ -name 'cfg*' -not -type d -print) $(find ./ -name '*.cfg' -not -type d -print)
    install -t "$pkgdir"/opt/epsxe/plugins $(find ./ -name '*.so.*' -print)

    # permissions
    chmod 775 "$pkgdir"/opt/epsxe/{cfg,plugins}
    chown root:games "$pkgdir"/opt/epsxe/cfg
    chown root:games "$pkgdir"/opt/epsxe/plugins
    chmod 664 "$pkgdir"/opt/epsxe/cfg/gpuPeopsSoftX.cfg
    chmod 755 "$pkgdir"/opt/epsxe/cfg/cfgPeopsSoft
    chmod 755 "$pkgdir"/opt/epsxe/plugins/libgpuPeopsSoftX.so.1.0.18
}
