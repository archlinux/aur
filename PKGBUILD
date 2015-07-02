# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=eclipse-windowbuilder
pkgver=1.8.0
pkgrel=1
pkgdesc="WindowBuilder plugins (SWT Designer and Swing Designer) for Eclipse IDE"
arch=('any')
url="http://projects.eclipse.org/projects/tools.windowbuilder"
license=('EPL')
depends=('eclipse>=4.4' )
makedepends=('unzip')
source=('http://download.eclipse.org/windowbuilder/WB/release/R201506241200-1/WB_v1.8.0_UpdateSite_for_Eclipse4.4.zip')
md5sums=('80f78b3bc2b046b6f00c5adfa0887268')


build()
{
    return 0;
}

package()
{    
    _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

    # Features
    find features -type f | while read _feature ; do
        if [[ ${_feature} =~ (.*\.jar$) ]] ; then
            install -dm755 ${_dest}/${_feature%*.jar}
            cd ${_dest}/${_feature/.jar}
            # extract features (otherwise they are not visible in about dialog)
            jar xf ${srcdir}/${_feature} || return 1
        else
            install -Dm644 ${_feature} ${_dest}/${_feature}
        fi
    done

    # Plugins
    find plugins -type f | while read _plugin ; do
        install -Dm644 "${_plugin}" "${_dest}/${_plugin}"
    done
}

