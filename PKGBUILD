# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

#TODO: set up permissions (e.g. fortress/{progs,sounds, etc.} to be sticky-bit and writable? that way maybe at least files can be downloaded. create maps dir for all mods too.
#TODO: change permissions for all .cfg's to 664?
#TODO: way to force mode/ownership of newly created files? umask per dir?
# NOTE: as of 2.3-8, with pacman 5 there is crippled support for split-package. so we build one friggin' huge thing.
# sorry, community- i do hope someday that pacman devs stop making arbitrary changes on a whim.

pkgname=('nquakesv')
pkgver=1.4
pkgrel=2
pkgdesc="The easiest, quickest, and most popular QuakeWorld server."
url="http://nquake.com/"
license=('GPL2' 'custom')
#depends=('unzip' 'ezquake' 'python')
depends=('unzip' 'python')
makedepends=('dos2unix')
#conflicts=('nquake')
arch=('any')
install=nquakesv.install
_pkgname=nquake

_alt_pkgver=$(echo ${pkgver} | sed -e 's/\.//g')

# http://nquake.sourceforge.net/nquake.ini for list of mirrors
#_nQ_MIRROR="http://quakeservers.nquake.com" # NL
_nQ_MIRROR="http://fnu.nquake.com" # Uppsala, SE
#_nQ_MIRROR="http://quake.tdhack.com/nquake" # FR
#_nQ_MIRROR="http://nquake.quake1.de" # DE

source=("${_nQ_MIRROR}/sv-gpl.zip"
	"${_nQ_MIRROR}/sv-non-gpl.zip"
	"${_nQ_MIRROR}/qsw106.zip"
	"${_nQ_MIRROR}/sv-configs.zip"
	"CC0-1.0::https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt"
	"nquakesv.run"
	"README.arch"
	"dirtree.lst"
	"linktree.lst"
	"nquakesv-init.py"
	"nquakesv@.service"
	"sv-gpl.zip.sig"
	"sv-non-gpl.zip.sig"
	"CC0-1.0.sig"
	"qsw106.zip.sig"
	"sv-configs.zip.sig"
	"nquakesv.run.sig"
	"README.arch.sig"
	"dirtree.lst.sig"
	"linktree.lst.sig"
	"nquakesv-init.py.sig"
	"nquakesv@.service")

source_x86_64=("${_nQ_MIRROR}/sv-bin-x64.zip"
	       "sv-bin-x64.zip.sig")
source_x86=("${_nQ_MIRROR}/sv-bin-x86.zip"
	    "sv-bin-x86.zip.sig")

if [[ "${CARCH}" == 'x86_64' ]];
then
	BITNESS='64'
elif [[ "${CARCH}" == 'i686' ]];
then
	BITNESS='86'
fi

noextract=('qsw106.zip'
	   "sv-bin-x${BITNESS}.zip")

sha512sums=('6a07601f56aec5d88b3463c09c4482a2d76e5d7efd8ddc24c1b4e9b662152f62070dbb5409c1a801560872c725b5b8b1d41437b7b99c74bdcc1ae88d2be91121' # sv-gpl.zip
	    '21e6ef7a58c03e342b501a345fd777472b9d109a95201fa859c99d626845d01cf90d0ce6c42f76f5878795f1bcd549128250b9f8e82fceedb8b1f6534b9a1e32' # sv-non-gpl.zip
	    '32df717a4a8f121358243333c30d8d0e5d43ee04f3ee8175a894199b8932e90ebedc6b687c25207c6191dbf25363307f09f8c1dc767b58e254e015c150217384' # qsw106.zip
	    '93d6879712f7bdd56e3ab8f018810bb66a2d4d89e7dfcabf53668eaf23dd984959a1fbe4ecaa743e98b9be2b65de5b2746529b195c78b0c1ff0996e32d8fdd1b' # sv-configs.zip
	    '1eb4436f8d58766cbe99db97e5e8c0db8a706376afd291c337de1ba7a6b066d3791dc85ad034bdd54ea336bed6e6e8e7a037d8b04b2773c9c7517b9d9921d1fa' # CC0-1.0
	    '61fdec91aeee6b773d451b7407bca55fba5cd152654385b208c9a63c4e92c9f3fba2d8ad45b09585134ba5e1e7f6796c4ad706e5e564bbf3617026994cf30822' # nquakesv.run
	    'b083d3884c9885ab402e58c95ec3b5288ee06afce2bab83af1610c9d2ee174ce7b77748647499cb82d9a3f4686d936e9a91b5feccae0818addd236907952c3d1' # README.arch
	    '2bd1a5f1aaec1332f1812d416568f8cd6d1506166f6863743e5c66c83ad5cc74e2415470c28b9f75cb2e20f04c51b930474bbb8073f2f47cb63765cfb144fda3' # dirtree.lst
	    '562b17c114f4bc92116acce9a41dbb3d1031ae4ab5ae844e42a61ad3304ae95c86c299069c34966681af44516b5c58b05133441715f2cf4234697a9b3f58c250' # linktree.lst
	    '21d279b5494d2cd777693eade8dde35c5ba7a6dba395828153d1b390ee768fb3ccb57d4b9c4a1dd5bc47d061a3242d9d659c23f310360c76cff95962baaf9a86' # nquakesv-init.py
	    '157cba05212f59c978a0d08f98fbd2f8b888f43d185db655f4517f70470eb304fcdfcfca26c01a244f3cbd2fd79290461971ca8109ae1ce59129fa6ba89f1347' # nquakesv@.service
	    'SKIP' # onwards are .sig files
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP')

sha512sums_x86_64=('eab8feab5148ef9c3d3a8c644cbc7b621b9132c73e1b25cd62eb28a47e9e0ffd9500b665b22c015c9aca2db10a316a5669e7d8569ddaec0a9610e9c477dc225c' # sv-bin-x64.zip
                   'SKIP') # "".sig
sha512sums_i686=('c4b32e5f409a603adea54206b0ebbebb1b7907d7a56065e7730ca01931de33258e6f859d3d9805ffaf8dff9bcedea26e8455a016fa36b6d08eaf1540b8bbacad' # sv-bin-x86.zip
                 'SKIP') # "".sig

prepare () {
	unzip -o -j "qsw106.zip" "ID1/PAK0.PAK"
        unzip -o -j "qsw106.zip" "LICINFO.TXT"
        unzip -o -j "qsw106.zip" "README.TXT"
        unzip -o -j "qsw106.zip" "SLICNSE.TXT"
	# Necessary because bsdtar's absolutely silly and keeps trying to extract the contents of the extracted zip or something. friggin' pacman.
	unzip -o sv-bin-x${BITNESS}.zip
}

package () {
### SELF-PROVIDED ###
	install -d -m 0755 ${pkgdir}/usr/bin
	install -d -m 0755 ${pkgdir}/usr/share/doc/${pkgname}
	install -d -m 0755 ${pkgdir}/usr/share/${pkgname}
	install -d -m 0755 ${pkgdir}/usr/share/${pkgname}/qtv
	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
	install -d -m 0755 ${pkgdir}/usr/share/${pkgname}/qw/maps
	install -D -m 0755 ${srcdir}/${pkgname}.run ${pkgdir}/usr/bin/${pkgname}
	install -D -m 0755 ${srcdir}/${pkgname}-init.py ${pkgdir}/usr/bin/${pkgname}-init
	install -D -m 0644 ${srcdir}/README.arch ${pkgdir}/usr/share/doc/${pkgname}/README.arch
	install -D -m 0644 ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${pkgname}/CC0-1.0
	install -D -m 0644 ${srcdir}/dirtree.lst ${pkgdir}/usr/share/${pkgname}/dirtree.lst
	install -D -m 0644 ${srcdir}/linktree.lst ${pkgdir}/usr/share/${pkgname}/linktree.lst

### NQUAKE-PROVIDED ##
	# Implement the following in ezQuake
	#chgrp games ${pkgdir}/usr/bin/ezquake
	#chmod 0750 ${pkgdir}/usr/bin/ezquake

	# And the Business-End(TM). Do the thing.
	install -D -m 0775 ${srcdir}/mvdsv ${pkgdir}/usr/share/${pkgname}/mvdsv
	install -D -m 0775 ${srcdir}/qwfwd/qwfwd.bin ${pkgdir}/usr/share/${pkgname}/qwfwd
	install -D -m 0775 ${srcdir}/qtv/qtv.bin ${pkgdir}/usr/share/${pkgname}/quaketv
	install -D -m 0644 ${srcdir}/PAK0.PAK ${pkgdir}/usr/share/${pkgname}/id1/pak0.pak.DEMO
        install -D -m 0644 ${srcdir}/LICINFO.TXT ${pkgdir}/usr/share/doc/${pkgname}/quake_shareware_license_info.txt
        install -D -m 0644 ${srcdir}/README.TXT ${pkgdir}/usr/share/doc/${pkgname}/quake_shareware_readme.txt
        install -D -m 0644 ${srcdir}/SLICNSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/quake_shareware.txt
	cp -a ${srcdir}/qw/maps/* ${pkgdir}/usr/share/${pkgname}/qw/maps/.
	# And the Business-End(TM). Do the thing.
	cp -a ${srcdir}/README ${pkgdir}/usr/share/doc/${pkgname}/readme.txt  # nQuake FAQ, credits, etc.

## KTX ##
	# Most of these files are in sv-gpl.zip and sv-non-gpl.zip. some are in sv-bin-x${BITNESS}.zip
	cp -a ${srcdir}/ktx ${pkgdir}/usr/share/${pkgname}/.

## QTV ##
	cp -a ${srcdir}/qtv/qtv ${pkgdir}/usr/share/${pkgname}/qtv/.
	install -D -m 0644 ${srcdir}/qtv/qtv.cfg ${pkgdir}/usr/share/${pkgname}/qtv/qtv.cfg

## QWFWD ##
	install -D -m 0644 ${srcdir}/qwfwd/qwfwd.cfg ${pkgdir}/usr/share/${pkgname}/qwfwd.d/qwfwd.cfg

### CLEANUP ###
	# TODO: We can remove the makedepends on unix2dos if we use sed for this, but i'd need to do some testing
	for i in '*.txt' '*.cfg' 'README';
	do
	  find ${pkgdir}/ -type f -iname "${i}" -exec unix2dos -q '{}' \;
	done
	find ${pkgdir}/ -type f -iname "*.sh" -delete
	rm ${pkgdir}/usr/share/${pkgname}/ktx/portx.cfg
	rm ${pkgdir}/usr/share/${pkgname}/ktx/demos/demoshere

### FORTRESS ##
# TODO
#	# Most of these files are in addon-fortress.zip
#	install -d -m 0750 ${pkgdir}/opt/quake/
#	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
#	cp -a ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${pkgname}/.
#	# And the Business-End(TM). Do the thing.
#	cp -a ${srcdir}/fortress ${pkgdir}/opt/quake/.  # The entire mod
#
### ARENA ##
# TODO
#	# Most of these files are in addon-clanarena.zip
#	install -d -m 0750 ${pkgdir}/opt/quake/
#	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
#	cp -a ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${pkgname}/.
#	# And the Business-End(TM). Do the thing.
#	cp -a ${srcdir}/arena ${pkgdir}/opt/quake/.  # The entire mod
#	cp -a ${srcdir}/prox ${pkgdir}/opt/quake/.  # QuakeProxy, I think?

}
