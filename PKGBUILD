# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=eclipse-windowbuilder
pkgver=1.8.0
pkgrel=2
pkgdesc="WindowBuilder plugins (SWT Designer and Swing Designer) for Eclipse IDE"
arch=('any')
url="http://projects.eclipse.org/projects/tools.windowbuilder"
license=('EPL')
depends=('eclipse>=4.5' )
makedepends=('unzip')
source=('http://download.eclipse.org/windowbuilder/WB/release/R201506241200-1/WB_v1.8.0_UpdateSite_for_Eclipse4.5.zip')
sha512sums=('b5e3181c4c746a38b2c77e213f214ab9a8a28bb528adc7bda39c179205e68c34b3c9e1dacc97ae01eda84d010dc2f52c9f7fd09724771d9807abdae414b28698')


build()
{
    return 0;
}

package()
{    
    _dest=${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse

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

