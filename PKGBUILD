# Contributor: Loryeam <loryeam aaaatttt gmail ddooottt com>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Zepman <the_zep_man@hotmail.com>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: reflexing <reflexing@reflexing.ru>

# Instructions were copied from ttf-ms-win11-auto and slightly modified:
#
# BUILD INSTRUCTIONS:
# -------------------
#
# Please note, that usage of Microsoft fonts outside running Windows
# system is prohibited by EULA (although in certain countries EULA is invalid).
# Please consult Microsoft license before using fonts.
#
# This PKGBUILD attempts to download fonts directly from Microsoft, by
# retrieving selective parts of the Windows 11 Enterprise 90-day evaluation
# edition. This only works if the user is allowed to mount filesystems through
# udisks2. This is determined by Polkit, which by default only allows users to
# do this when they are logged in locally (e.g. not through SSH).
#
# If it is possible to download fonts directly, around 200 MiB of data will be
# downloaded. Downloading the fonts this way can take 8-20 minutes, even on a
# fast connection. Be patient. Note that for this method, it is necessary to
# mount an HTTP source and an ISO file as a loop device using FUSE. If the
# build fails, it might be that these must be unmounted manually. This can be
# done with:
#
#  $ udisksctl unmount -b /dev/loopX
#  $ udisksctl loop-delete -b /dev/loopX
#  $ fusermount -uz src/mnt/http
#
# Replace /dev/loopX with the relevant loop device, which is reported during
# package build. If it isn't reported then loop device creation is not yet
# finished and it errored out due to timeout. It usually happens due to slow or
# inconsistent network. In such a case, you can do one of the following:
#  1. wait for the loop device to be created and run the above commands, or
#  2. just run the above 'fusermount' command (doing this might leave redundant
#     loop devices which can be later removed with a simple system reboot);
# and then try building the package again.
#
# A file integrity check is performed after download. Due to the unconventional
# way that the data is downloaded, the verification is done in prepare().
#
# This package uses HTTPDirFS with permanent cache. Due to this the maximum
# download speed is around 15MiB/s. To disable cache, find and remove the
# '--cache' option from httpdirfs. Read more about HTTPDirFS permanent cache
# here: https://github.com/fangfufu/httpdirfs#permanent-cache-system
#
# If fonts cannot be downloaded directly, the ISO fill will be fully
# downloaded. Due to that install.wim will be extracted from the ISO, it is
# assumed that twice its size (almost 8 GiB) is necessary as temporary disk
# space. A free disk space check is performed before the ISO is downloaded.
#
# Please ignore any 'ln' errors when building this package. This is expected
# behavior.
#
# If for some reason you want to download the full ISO file, please visit:
#
#       https://learn.microsoft.com/en-us/azure/virtual-desktop/windows-11-language-packs
#
# This package is based on ttf-ms-win11. Use that package if font files from
# a local source need to be used.
#
# ttf-ms-win11 and ttf-ms-win10-auto are considered to be upstream for this
# package, which is why its maintainers and contributors are added as
# contributors to this package. Without their effort this package would not
# exist, nor be updated.
#

pkgbase=ttf-ms-win11-fod-auto
pkgname=($pkgbase{-hans,-guru,-gujr,-ethi,-deva,-cher,-cans,-beng,-arab,-thai,-telu,-taml,-syrc,-sinh,-paneuropean,-orya,-mlym,-laoo,-kore,-knda,-khmr,-jpan,-hebr,-hant})
pkgver=22621.1.220506_1250
pkgrel=1
arch=(any)
url='https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages'
license=(custom)
provides=(ttf-font ttf-ms-win11-fod)
makedepends=(udisks2 p7zip httpdirfs)

# URL of ISO file from which to extract the fonts.
_iso="https://software-static.download.prss.microsoft.com/dbazure/988969d5-f34g-4e03-ac9d-1f9786c66749/22621.1.220506-1250.ni_release_amd64fre_CLIENT_LOF_PACKAGES_OEM.iso"

arab=(
arabtype.ttf
tradbdo.ttf
trado.ttf
majalla.ttf
majallab.ttf
simpbdo.ttf
simpfxo.ttf
simpo.ttf
msuighub.ttf
msuighur.ttf
UrdType.ttf
UrdTypeb.ttf
aldhabi.ttf
andlso.ttf
)
beng=(
Shonar.ttf
Shonarb.ttf
vrinda.ttf
vrindab.ttf
)
cans=(
euphemia.ttf
)
cher=(
plantc.ttf
)
deva=(
aparaj.ttf
aparajb.ttf
aparajbi.ttf
aparaji.ttf
Sanskr.ttf
kokila.ttf
kokilab.ttf
kokilabi.ttf
kokilai.ttf
mangal.ttf
mangalb.ttf
utsaah.ttf
utsaahb.ttf
utsaahbi.ttf
utsaahi.ttf
)
ethi=(
nyala.ttf
)
gujr=(
shruti.ttf
shrutib.ttf
)
guru=(
raavi.ttf
raavib.ttf
)
hans=(
Deng.ttf
Dengb.ttf
Dengl.ttf
simfang.ttf
simhei.ttf
simkai.ttf
)
hant=(
kaiu.ttf
mingliu.ttc
)
hebr=(
lvnm.ttf
lvnmbd.ttf
ahronbd.ttf
frank.ttf
david.ttf
davidbd.ttf
gisha.ttf
gishabd.ttf
mriam.ttf
mriamc.ttf
nrkis.ttf
rod.ttf
)
jpan=(
BIZ-UDMinchoM.ttc
UDDigiKyokashoN-B.ttc
UDDigiKyokashoN-R.ttc
BIZ-UDGothicB.ttc
BIZ-UDGothicR.ttc
meiryo.ttc
meiryob.ttc
msgothic.ttc
msmincho.ttc
yumin.ttf
yumindb.ttf
yuminl.ttf
)
khmr=(
moolbor.ttf
daunpenh.ttf
KhmerUI.ttf
KhmerUIb.ttf
)
knda=(
tunga.ttf
tungab.ttf
)
kore=(
batang.ttc
gulim.ttc
)
laoo=(
dokchamp.ttf
LaoUI.ttf
LaoUIb.ttf
)
mlym=(
kartika.ttf
kartikab.ttf
)
orya=(
kalinga.ttf
kalingab.ttf
)
paneuropean=(
NHaasGroteskTXPro-It.ttf
NHaasGroteskTXPro-Rg.ttf
RockwellNova-Bold.ttf
RockwellNova-BoldItalic.ttf
RockwellNova-ExtraBold.ttf
RockwellNova-ExtraBoldItalic.ttf
RockwellNova-Italic.ttf
RockwellNova-Light.ttf
RockwellNova-LightItalic.ttf
RockwellNova.ttf
RockwellNovaCond-Bold.ttf
RockwellNovaCond-BoldItalic.ttf
RockwellNovaCond-Italic.ttf
RockwellNovaCond-Light.ttf
RockwellNovaCond-LightItalic.ttf
RockwellNovaCond.ttf
GeorgiaPro-Black.ttf
GeorgiaPro-BlackItalic.ttf
GeorgiaPro-Bold.ttf
GeorgiaPro-BoldItalic.ttf
GeorgiaPro-CondBlack.ttf
GeorgiaPro-CondBlackItalic.ttf
GeorgiaPro-CondBold.ttf
GeorgiaPro-CondBoldItalic.ttf
GeorgiaPro-CondItalic.ttf
GeorgiaPro-CondLight.ttf
GeorgiaPro-CondLightItalic.ttf
GeorgiaPro-CondRegular.ttf
GeorgiaPro-CondSemiBold.ttf
GeorgiaPro-CondSemiBoldItalic.ttf
GeorgiaPro-Italic.ttf
GeorgiaPro-Light.ttf
GeorgiaPro-LightItalic.ttf
GeorgiaPro-Regular.ttf
GeorgiaPro-SemiBold.ttf
GeorgiaPro-SemiBoldItalic.ttf
VerdanaPro-Black.ttf
VerdanaPro-BlackItalic.ttf
VerdanaPro-Bold.ttf
VerdanaPro-BoldItalic.ttf
VerdanaPro-CondBlack.ttf
VerdanaPro-CondBlackItalic.ttf
VerdanaPro-CondBold.ttf
VerdanaPro-CondBoldItalic.ttf
VerdanaPro-CondItalic.ttf
VerdanaPro-CondLight.ttf
VerdanaPro-CondLightItalic.ttf
VerdanaPro-CondRegular.ttf
VerdanaPro-CondSemiBold.ttf
VerdanaPro-CondSemiBoldItalic.ttf
VerdanaPro-Italic.ttf
VerdanaPro-Light.ttf
VerdanaPro-LightItalic.ttf
VerdanaPro-Regular.ttf
VerdanaPro-SemiBold.ttf
VerdanaPro-SemiBoldItalic.ttf
ArialNova-Bold.ttf
ArialNova-BoldItalic.ttf
ArialNova-Italic.ttf
ArialNova-Light.ttf
ArialNova-LightItalic.ttf
ArialNova.ttf
ArialNovaCond-Bold.ttf
ArialNovaCond-BoldItalic.ttf
ArialNovaCond-Italic.ttf
ArialNovaCond-Light.ttf
ArialNovaCond-LightItalic.ttf
ArialNovaCond.ttf
GillSansBoItNova.ttf
GillSansBoNova.ttf
GillSansCondBoItNova.ttf
GillSansCondBoNova.ttf
GillSansCondExtraItNova.ttf
GillSansCondExtraNova.ttf
GillSansCondItNova.ttf
GillSansCondLightItNova.ttf
GillSansCondLightNova.ttf
GillSansCondNova.ttf
GillSansCondUltraBoNova.ttf
GillSansItNova.ttf
GillSansLightItNova.ttf
GillSansLightNova.ttf
GillSansNova.ttf
GillSansUltraBoNova.ttf
)
sinh=(
iskpota.ttf
iskpotab.ttf
)
syrc=(
estre.ttf
)
taml=(
latha.ttf
lathab.ttf
vijaya.ttf
vijayab.ttf
)
telu=(
gautami.ttf
gautamib.ttf
Vani.ttf
Vanib.ttf
)
thai=(
browalia.ttc
upcdb.ttf
upcdbi.ttf
upcdi.ttf
upcdl.ttf
upceb.ttf
upcebi.ttf
upcei.ttf
upcel.ttf
upcfb.ttf
upcfbi.ttf
upcfi.ttf
upcfl.ttf
upcjb.ttf
upcjbi.ttf
upcji.ttf
upcjl.ttf
leelawad.ttf
leelawdb.ttf
upckb.ttf
upckbi.ttf
upcki.ttf
upckl.ttf
angsana.ttc
cordia.ttc
upcib.ttf
upcibi.ttf
upcii.ttf
upcil.ttf
upclb.ttf
upclbi.ttf
upcli.ttf
upcll.ttf
)

DLAGENTS=('http::/usr/bin/true'
          'https::/usr/bin/true'
          'file::/usr/bin/true')

source=("$_iso"
        "${hans[@]/#/file://}"
        "${guru[@]/#/file://}"
        "${gujr[@]/#/file://}"
        "${ethi[@]/#/file://}"
        "${deva[@]/#/file://}"
        "${cher[@]/#/file://}"
        "${cans[@]/#/file://}"
        "${beng[@]/#/file://}"
        "${arab[@]/#/file://}"
        "${thai[@]/#/file://}"
        "${telu[@]/#/file://}"
        "${taml[@]/#/file://}"
        "${syrc[@]/#/file://}"
        "${sinh[@]/#/file://}"
        "${paneuropean[@]/#/file://}"
        "${orya[@]/#/file://}"
        "${mlym[@]/#/file://}"
        "${laoo[@]/#/file://}"
        "${kore[@]/#/file://}"
        "${knda[@]/#/file://}"
        "${khmr[@]/#/file://}"
        "${jpan[@]/#/file://}"
        "${hebr[@]/#/file://}"
        "${hant[@]/#/file://}"
)

_sha256sums=(
'237e6e4264d4f09314fb6777839e6ef2deb1f4de4bdc16b146d566ce046ba0fd'
'9432e9e21abb60db92ada50444f8e8905c4cfc7d7520302e01f7d87c8306a7e5'
'994414c3cedb579c6dea5cc6d9262977cb09e3990ebd1830431db4d0aae337d0'
'3e2d44b01c9a248a61bedae4f15c8aae501328b1f7adfe6e111a5da5aa5c5104'
'aa4560dd8fe5645745fed3ffa301c3ca4d6c03cbd738145b613303961ba733b8'
'9dd76f7ab430edd091db24c3f18e71410325c1414141aad5fe67947873ffba06'
'aba1579ef29ec6e9fd4a5576c0065b4fa8546450bee7918ace96979fb6d029be'
'cbc7b9539a176da428ec0755a8073e86fb7a97a90a17469aa8be40d850e64206'
'3a1749a8f64fa56dda7ea76194b55cb6a37b387099f16d72458f7e340c5f4d6e'
'8231f49a026c7cb4eba3e8f5fbc8331e6a53a5bdd59964ee9d36cf45b37e26ee'
'8a2ca12269be1a9e4738c9eac8f344fec993a65bfa7547872a71e8dab91777e3'
'4fe00d4dfea7826e819eb3773055ebf6de7514814bca1ed8dfab1df8e4d55b57'
'18c4fadaa5f7012ced528d7f079df053a9dbcaa4b5645c5861a51599d4f75e37'
'44dd70dbb4b5debc4e36c831808f626e6d76505ffce3214fe21c63cf7f9442d0'
'7161fb5d54094817176ad9866815f4e46a535a6dfc2e4932e4e7425121ca2464'
'adcb6991427512854e406ce3790960531d66963e20b71805f8a1ee875b6dfae7'
'b3122e6cf290dcec68ac0192701cfab232a877bfb2d6d3c41b07e4400fa41a56'
'e340546de256e22ff856658d392d86d57d915af0bc5c42171b65bf9f6afb6a15'
'0ecb317d1733fac7825a1a4db07a27bd8ae395e922fa95442a7afa52ba20c27a'
'3defc4b9f30396a754f3abfce6941632ca94f2891def881c8fdfed1bea44e6a7'
'100a2a0444156ad33dc0c701a5cb35da608baec851a2c4ba1020afba51c36428'
'b4f15f7f9dd87c14abecc99fc5779d7756f0ba89809a094c7d4b9e21c0f21252'
'229468ae394c7559700954eb78ae14b92820aa685aa4e422a7806e7a22b1c432'
'793e0c012a0abe1162b3a24f226088c22ecb702addb2d3a2a6e5e3ee15597817'
'3833929bb32a3ed67b972aa7c5e0314c919e404be0a6df40c30178cbd9ee6bdb'
'62b2d07d00bf12a1170754357020986fe0707ff45c5628e85f4a1fc1aba16eed'
'eb90e62e98b570df10d99bbf32ee94025e4a9743bb4010b984fbbbe5b13ff418'
'7503c7b1b99f906851365bea0a49d7ab95a0cb158b397a440e2a332ed06dc558'
'819e614972126b01c3f75bf1b2aa89c59270788c47582782315bcf803a832924'
'20316d16c79d7c48389d2342d88bac140029f61b9003011f4fa0b159c534590e'
'8d24f28334c99fa903795114be7336ae0f49d68388498198c6b81fcc8123d05a'
'2b93956bfa8af7907388be83b8a06c190ee47dc0e7b53a099b0a48f88c5fccd8'
'101ae78fa1d91abdc629391d6bc7d5ee3421e3bc8640a0b5f4e17b20936be8e9'
'2a186f9e29d246b282645f963664b04d99dde16f7b8f8e5e5cf2c230f620d6d5'
'efd0c380676a4e49af7f2c2a8cc2f20a8727903609cdc1a26853eedbbb9611bf'
'5efde17f7a74655c34e29d8d88fba2caf261d1dcc7b828615653976b7c0ed0ba'
'df26828a562643bcb8e9b4d757d47e0213998db0f35e4cee08ec5ff5f87fd431'
'5ab73bd7957d0ac0b5cacd18ebcf19af6d0718da081c8c6942726f94b3c408bc'
'756d4b800772da4ba298a6ddaaa6b3aa8fc68b63a1b20e5999b98f64122a3fdb'
'08900f011f18f184047044bf4087857d6842d7f7126c0b88035447ba9bd37e30'
'8ad214f1919b2cb8a7583cf2019a4e72bae182dfce0b5738c1780b2ab62d8f57'
'b7d31a1a0b8b26ae3233044e646a4ce37061cec96a265ecd00f4c57d3cbba58f'
'9b513ddff9dc34b31cb8e93e48e5db9ff7ef0aad18abc1b4da2c0bd800cb7bde'
'681f35684afe5d945691d2c45d7f025e5b7e1a3e2f504ec298cd9b59be3b689d'
'e2e9c03ec4ef6eb1e19e4cced10725d0d83cf906ae5a71597c0a82f7e3b3f788'
'9b8dc4323dc148795c5737a7a036f2bade5978eddce975ff6e1c180010770f8a'
'0a8a88f66122f92bde4e128fb09d2cbad0709372e1887bca86c61fc845c8f846'
'3faa1151ad1223e67d5239e1a720dd393852eff0b14e1738afce9b2a4f73881f'
'a679d8abfb4e2604aa120a2c5a0e64885a175a8b20aa4278820ad699f1f6f19d'
'12e8f0c460e8ce547822cb81dd4576497c0fce7f999def6066275a8723c1c8d1'
'b2cd4d6d863303015403b042830d13571ed04466fc37fb2e62b4ce8b763b9331'
'79127ea561e584bac407a13094840be7d01f9b367ec3a085a6dc9c99c55d9c57'
'3eea7179edd165ca1fe484873992c2cc7a464ac5455187b4eab7f21ed7101531'
'86e920262186f7bce252da236fe2390ad899b833fc76079fa927b8eb43d93e71'
'9e673dbabc23a65a102a24afedb6e69d0cc3c1a7f32f54cb30a269de7645f814'
'd7a89012876127f1bf9938aa5278ec8a439e2b4b54f33093240abca8c135b29b'
'11fd393dec8b38813c38562253ef5c33bdc8ad7e0272f10ab2da96f584b07fcd'
'6119dba806cb36feb47fc5526ff77a3f20b074320293308c2479c21683c059f4'
'd70a6787ceead297c17ea5ae0fa91dc2820e457247bd189c1bcdee960714c178'
'e32c2c5fc9e2a1442f0c2a644eb569da1c299002a19646eea7cc52f8b2e48726'
'ebbb8c5ecb4c54709f1fd0a5cbd1ff85095284ca14d4ce918824b1b4323583d6'
'08d0b28ea2672b69ef3ce974cedac03fb93718bbfc44a145c3b6eb14e0ee8fbb'
'8cd1347126ff73a389bc180cb3cd89e943fb8562a89aff1240df988bb3a90cfb'
'4bbcda89375cac003f4fea06ec83934716cad0c63061447cc173b7d5c363b5be'
'd24b407201bd5f95c7e18f8161e00e3371aa4a0c64e1f08cac7afe35e7d1a025'
'a379cbb1d88efa19a03e38a50eb7f10245d5dabe654acaae23908e5180639a11'
'cf9fdfa376dc2bb66921ffe09591aa10add64bfc4779e223a396e39f23be5f6f'
'01eb2b1566f6b339658c97068d063d7de2ee2948d14709d9d3994c2c5ccf3838'
'a210518d99798c36869e686b0fe2b2fc16c0c5935c58033e4044935f6fd9e2f0'
'81b164d58ff42001927790227e83cbb10c34097458193eba4405e10dfb6bc5c2'
'dc6caa7f3602807f5e989e6784e6376cd5d68aeb824a4c2432a0532c4a402546'
'd89c60cd47139df9f2ed9da25373745093c8083b60bab7be2b58c4889d6c7dfa'
'3a82a38db99e10d6f1ae76c76b3f2577f53504b295f851620138f1776cb0f2d2'
'd5dc8ad7ca34a756dfcfe4820954ef94730f693adabaa188da85cf23309e4bf2'
'317eeb886d0db46596d211e398f64c4a1df8f9707e66ddb4d4b3c3b8faf80899'
'76bc67b2b121b434e797f9fcdeebc2054fe1dc13341e8394dcd07786aa02c638'
'eabd7553f81c3f6dd3e1a19c99ae42507a671c5e43e209079e5126e56fbd012f'
'3434e1afce64009242304c74fee161b99d11d813440cbda7cb73e97eb45b62eb'
'7c3f899e07d771322c2155b3482e73b7a474f5d6b5262bc537d103ce3eb1950c'
'a015cf70b48ed882b7d95c91fa0d3c3a458c711fd5ac2eabc97da50a0e2b6f1b'
'30c983cea22859619f8dcb53857ba728ca74d82ce646207caff31262ec7f40b5'
'02c2765ce36754c68c0445b0fd938a669b957fe8497f805591b6928b01573029'
'8b7cc61a64647ec3dabc0fdc91c412d39dc1a7269277e54e1159070456f4efbe'
'a2a54053c23520b95236416e2b001bd488ebc8c75e6c6436a70edacdaaba1cb5'
'f91f3f796d00452aeb95fff4a19491c35b1c40499ba537a90367bf58b92ef828'
'c0372c8f7ac42e4f1890e994543b92b4d5949c578f1fa11e3ffedb38d05f1e82'
'9861194ddae2b487c2cfde9d716f8c6d77bc7cdd9b0e38ae75b650f0b89b8546'
'0a1fa882465829226e462211d87a0724157f2ccccafe63742586b90f9e34c9e7'
'80550cd00894ac00e8d35ce61b8d85fb277c7fceefd239052eb1360456b79019'
'33c6cfa3b3791a5d2a8f0b986f818ea367987eb27e462f30fa3f0b36adf0a393'
'9acfae05976aa6b4b67a1a4c385e0532b65c7c459b81d185634b5409f71468f5'
'8818c1183fb5451d64eac41a8b3780dfcd6fa640d81c7d250b0cf2e6553c598b'
'10d2d66455a66c4c32cf4fd429f4b454a90c27a4cb48b0c0f76c5387a38d4f89'
'5417512b66aa9fd2f1fd0799818ac88daa299acb57da15c21a5c70c348e8d235'
'4836d24603811e4c8e31cd642939329a03044034191202a33fe1d2428bbf4e63'
'c54d947482558e662feb37c1f944f5ee81d47a07423e9d6e40bcf15d35b49381'
'bc35d7a98da383dd8c328a79b2b0e7636003150b41b11ea02249a4b7ae53f48b'
'27c1180f678ac58bbdbab5e20ceac537a8d6067d04b9071ca065d9237e11326d'
'70d2d357ef03fd6a788feb67db3301a6baf680944fa4e1545b71daab656d4b3b'
'5cd2ffd742f216aa9cbbdb48682ce7cc7bab6b1ff974cef0d6ee35a32ecc62ce'
'eaf60201b85c60b8110189d19ef0d27189e141838f02990a1f079d727e096285'
'8e72675d45135b116a2b48e4a1a8f965c58afdaec87a261641ee6efb22c3c050'
'73f4ac55d76476e75006e96585cdbc0381839d4c4e55d6fc2b94a6c2a937715d'
'74d8b3e9241fd364e45bf85fc7706667bd3f08d1e68d5586e7ac2d7dbd21f221'
'a37ca3521e2b19f5df822b649a48d7a725e493099590c2d2a252fcc78f862d8c'
'd770a110b880e748658d6009c11496dd9e78f6c844be48d09a6f00f61888ca97'
'330e4ba7d299b071b37ea6409b33900eeb7dd0bb3e4ac57223fd6931d1c8cddc'
'b6a0c456c69a8c662525fd65a19b1988800880f96accb4844f70f65917f0251c'
'ef9c48661c2c9d4ab124e1a0f7597f38f64f6f21fb6550e44cc7c33a5045a541'
'd71cd8d4cf5440e58067aa07e50bb959f9515798b64d4b716c484f1816f641ae'
'1adfbd7270a43b3b6d896692f81814c4bb248bc0c7b905e98f69cda02c2bb04e'
'9718464e272e1fac4b758a707c7270bbbc80020d4ee0e4a99b096e830561f651'
'4add7a3090db51193237b67a5cc6014b1cd332a10d5745974e0f56214c1512f9'
'312206ef84f15a6c953d6476b91115fd6d39216ec0778fee72e7dcf8910eec81'
'd59892ef756fbf109d8b8a76a2e1d949491499a7483f82b094264b4703818b47'
'e794f45ccb930fc2483e5eadbb052b3a11185209faabff5b605df2d700b1c300'
'3e8c10ef6c25f21d61ab5fff0afcdf3bf01ba2abea280590b60836f7e5091de2'
'320286347586bdcb5f86546681fa0cc2cbb8b16097d387bb81a01b4a9fc87d77'
'64fe5ad4cd9127b5c23bbd8fc2bd79fb808ee277b03f6e6691314b9f26c1dd66'
'a85836cf30551bcca3c42b6d065f533627e1d23a8fdefcead55816b71ba5543b'
'331409c9a1ea1ba780c9429b25433b073d0e34c924800998bef014b89f1b2943'
'f7ddf8e410d6738019764398f002cc014e8357712af3f38a5f17837758af60ba'
'7f7d620849ef4c8057fbe35b1510d11457efa1291298e516b533c1c684fb9a83'
'fb06ff2368ac10e97f475ca7fe2b2e4f9be4be4e9853ff3abd0ace5cd6f5f136'
'3e9adc4b4b476351852bb7025ec8674a427435781bbf09be59a06b06e530ee49'
'c8ad63741417c649743256e2c4cf4a6ffec09ccf8692871c0e4499184c9af0a2'
'8f2bb0099ae70e1e898d62675cf2bd6a51b9bf1132d3a04b01411a17a679bc92'
'8bb8443853520086e4aec991aaa1d9029876f323d474a9636ecbe2990d7a67fa'
'4c029059948183502eb2e488e8fbe0dceaa4cbfebfe6c4d3375f0ee352e3131e'
'ae21a065a28bb5b0e896aa0fb9d0004ed3665de745f380b8b6d69f32bd353420'
'1b3ab70c8397c7e1a2a57a8503ee0718a1bb066d45a4a618dd621d88d33abfb1'
'262a1065dee64c34dfac05ac6ea8f48b5834a7c6a2260c50284ea767948a52fc'
'0d0253e6b93522cd30b48f5b0c05c1ad7d529a71dc79725b2854f0a48d2e1fdc'
'f2709a0d821e0e6c8252f0a84f221ffded41f664fa2bfca3d5695f25928b01b4'
'ea9a2d4f4ea22942bce0fc29421f32e286b95e1deb81510890329227c9dc47d3'
'8e786d67476d75106f446aca000750a6c7b13f7e317994aa7da07b6db01a9ff5'
'7ad92aed8e9ed088e727c59c1287a384a27473cd7eaec66dda446d129ce658db'
'55695816662d8ba2267e01a66bcba2dde02189330c62b0612f1be86d45fa7e10'
'81c7875a49cd59c625b749485c9c1d4ac5590594e638e93f3d233e3d91c2f045'
'c4ee3ba42453a6dc618cef2225e1186223a055daddde8afb937bcdcd4163d5f4'
'18e14bcd14f8583658da09db4d2e3f4d876af1c049bd0156866767dfb9c148b4'
'1d1b53923729699d88a7ed27ab87a5f29257464074d0c49cb26ac6da17f56f75'
'd1d9cd78a6a4ac5c0a377713c2ba7c6c8cf3762cf18a3996843a54004d43b32e'
'335e4c9561df6f0dbe6d13b9458d0c18789451291faac0afd3bb77ceb3079488'
'0689104c237af770b46db04c2463ae8fe602d26630b81a9ccf89ba4f4a29357d'
'ee2ec517e48fd1d35ded8209793659a4c6f5ccc6ec173935218dd3df32a8dcb8'
'b15a8b705652b9667f4d8c00154854f132e4221a55b5d9d35b48a6b7d396c529'
'd306b783411777084eecc4617b859fe048643f0eb98adaadfe139331f3423dcf'
'6046b8bc984a59ef9390093ad6796294b2176981466d3c0a46001b8ac94556f9'
'f19f8d660a4f0874b1a123158da0ed1e643bcdc7fc534a4551d8a92c751a9f37'
'c0b30cbc36c90feb5698f8f50a2e2aa6cb09d787d49b9a15d02776c8a5e8a8f9'
'90cefaad9f0b27731308b088eed51d979fbcde85dcf71cc8292feb6622140ed0'
'879e81b5d54a647d26e720465c357817ad33ab671b4e3d1a8af2f734977bdc05'
'c517e7b9c74c725f05d2ec6c732fb9e8e5622f783d8141ae053e81eb05bca896'
'717f2cbdff5b635524ec5b26e99d8db107650893f2c126c6cad727b86bbed390'
'c26ee868f4075a54257ece1c4d98fe8ff9c0b46371ec328463eb400af62f9472'
'5e9ad93786974ed92a5e581ac110f5f1d6a69b953e450e362363945aa3700f73'
'c4cccc7aaaa1c6c9548c0a5fe93cd28cb4e944f1900c9d1d871d345dc8a61756'
'23a0fcca89e8a8d0a0caac612860a7ca719fc2a641c47a3ed085c4e4922c2574'
'b977a179ed4cf98129bd4e4682e0e965826bb36ede755bfe9e9410f555b93740'
'aa323dd23a2d55e58e44995af7d3f3b5425d226967aafc3d82fccd84e6902811'
'515de7af577342c97e8d9329eb1f005de225e9e380a0acbcb3d114c140c191bf'
'c7866235d9207ccb6ee32b0608100c2bfc6c5bc6797c6554daed6214ebec5c5d'
'8d9d678176cf788c6b5f8a8cca189c4315a1a9efd012172db52603ef4c31796f'
'945f0a5eadd23ad320f6dd1ac16fecb5bd4247700da070ab701b0b6860ed297e'
'6da59e3007d6af65e9449740485500986c227f798c9f2eafe8335e77a3262389'
'19eba86384f0279648e12083171b5aec821afb782bf5ccf5486ce7c243f636a3'
'f751ccb6dbc928fe536fb5496a017d9c6252d2904a756eb9297334bd1b5bc36b'
'9328a01c72d0129d4ba193de2ec6c6e8412a32c826860818568bbb6da52dfc09'
'751f085a4537ecba0b877770f877016622e362f937613a5f856a7ba715df0ff2'
'6a4e506fb809b4377d9696494c6e121914d79df6e72e4ac82753822f8d6622f9'
'2c64781512627d8c43135b329f82b80edc1f9eb444be3c2bbebfb3cd0cb172f9'
'a5e5778d59494514f7a74a56a4ae435ba7bb6771acbfc717b2128855d7207d3a'
'90795cdbd86b0e5c251370d1bab51753f656a1494ecb07bde82b397125d27ef3'
'398728876df03a2296f1d1620c219d012613dd3dd698364d1f00b1e79aa7a03d'
'dc9060725f6489497e24d97b5d7e254f42e9e05567ee8f1f31f7b3fc63009ca9'
'c4804c91224376f97bcab37083103c02fed960fbbbafa29420ac0fc1fb356b00'
'24ecc028331cdcbe4e0d090d6b5d66db9fa8978c1d6e652f99c30bf4bd5210f8'
'39d47e9d076c26287c04a24ab3f3b3dd26af903f962b67fa67c940c8d646d0bd'
'4dbdbe1b4507b2b4d092245e6ff0787bd43bad4a3bbe77bad860fcf7a3ce706f'
'ece8cbe4f7afa680e05231fd46e519d14057d06d3d11c5ef6bda1ae32b2bb5ce'
'84b0ba79a5d1c6012bbccf8d364ddc04a0c8b135d227a159196c558225cf1d89'
'4b9ac63e8920ed1bae29c068025ed30493464c18ee18617887daa18e59189226'
'9309a1d4343801fe85406e9324ef0ec8f82746c51d6d5e41f5cbb780f94e6a2a'
'74691732d0aa9b34c88b8d020d6e43e66b207ee0b25584c60bf81c471a414c4b'
'324474e3547086f33b4227ebab8a2f3094b8cba90ae0991a5196c91729f5bccb'
'3e236130c188e672fcf416b72655caa2b377accffbc30029b6540cc04699a08b'
'46c67d8e32d2cb0dbb56c491ebf06435f8f6fcbae7fbc8070b97936e288c8bd3'
'9b0e5c299c60fd352762b8baa07429734bbaa06f2fd0ba1ca33add3678a6600a'
'f3a149f2459f61a4dc310e3f2454f068cded470ef886cfe39969c92f9a95c847'
'3749e25eb366c6d356cae6a658180f34746d7aca17e4609087c46bf27b32f2ac'
'fb139c47122f4d1913ccf96dca6da9d7a99623c0433939c66b9a2d749366db8e'
'6a00072387ec6ec94eaaecf2520806749945a68ef9d81af891dae8223af36484'
'ddcfc7ab74c8bd08b397d4677f7604b4ea9df66a8c22917ccc8d50fa0824d4c1'
'457b306f719a002f1d037b2a3942f2abfa8a55d7bb109bf8950341a3129adb46'
'7d54f5a6a4202dae7b54d5a854770cb4fecd33f8975c0996e89c6ce31f4b0808'
'4bde3e6392b96910fb59094c6c1a4dbfae18fee78d0bf13dc30616837c4f95db'
'9be3424e24837ef9f07a272e4aea7779b50eeb77a0a23a95bac8e6489624deb6'
'6d16c4f4f33f42f2d427857c207f732c5cd56bad43e31ad435b18758dc4758d7'
'4aaa147e17688b9ab3937d4a90f8559e93e9326ed29690b8f14aa71515c3eff9'
'a907d9169b20a52f552a7be3f6b65c5d734f41cb4257079671bdf258d72a7f11'
'ef80de39ccc3e62677100f8d9afc0dca88e0c672ebdaa927f64eb4c997dff1b8'
'eb38e0dc76405b52d5f231f4317f2d345627c7fdcfa2a465f0564fa0b6fa37c5'
'c7422abaa2aad14dd1050fe7efca637a3f3ef1e81b5a5a311935653ea07cb803'
'6de498b2ef2fd7c87a62aafedd7473d95919faaf6a9dfa7557bb45f38f70490b'
'02106cfb319ebdb7d3db30d5d8ecbd5def0225d4445932b56b00e6b509a39308'
'60232ab659a84fd42931b2e799d18892788e3b7132259f4c593b92780a4b3545'
'4b6ef4d01d25efc221e790d49d86461addd3cc314a70039b1f7be6c11def7b82'
'8a0ca710b27ef0bdb23caed1b8510d210833b622f93115af56d2f103ef8608d6'
'999036a4cc3913a6135840e9ee65642a997370978bbadd07849e088ea902770c'
'eaf277e294f14192281ac12a7f624ff85b707741ba8ceb5d41e5817988f2b395'
'c488427dfa955b8d2c705141259d38eca410d5844b3b66ae8538d487aa5e880e'
'f0829cbc0877c03ac2800840c2363c264b32f0ca9da53cf0d0dd1510f5071c71'
'dd18bf7c4204f469ea37e03df19c7d398c29643648961918054d227ff8128fd1'
'af10c7d63c298419a789bb76cefb4b0b16b8b691969907507dec7a1a2c45c5be'
)

_totalSource=$(expr \
  1 + \
  ${#hans[@]} + \
  ${#guru[@]} + \
  ${#gujr[@]} + \
  ${#ethi[@]} + \
  ${#deva[@]} + \
  ${#cher[@]} + \
  ${#cans[@]} + \
  ${#beng[@]} + \
  ${#arab[@]} + \
  ${#thai[@]} + \
  ${#telu[@]} + \
  ${#taml[@]} + \
  ${#syrc[@]} + \
  ${#sinh[@]} + \
  ${#paneuropean[@]} + \
  ${#orya[@]} + \
  ${#mlym[@]} + \
  ${#laoo[@]} + \
  ${#kore[@]} + \
  ${#knda[@]} + \
  ${#khmr[@]} + \
  ${#jpan[@]} + \
  ${#hebr[@]} + \
  ${#hant[@]}
)

sha256sums=($(awk "BEGIN{for(c=0;c<${_totalSource};c++) printf \"SKIP\n\"}"))

prepare() {
  echo "- Examining locally available fonts"
  for _font in \
    ${hans[@]} \
    ${guru[@]} \
    ${gujr[@]} \
    ${ethi[@]} \
    ${deva[@]} \
    ${cher[@]} \
    ${cans[@]} \
    ${beng[@]} \
    ${arab[@]} \
    ${thai[@]} \
    ${telu[@]} \
    ${taml[@]} \
    ${syrc[@]} \
    ${sinh[@]} \
    ${paneuropean[@]} \
    ${orya[@]} \
    ${mlym[@]} \
    ${laoo[@]} \
    ${kore[@]} \
    ${knda[@]} \
    ${khmr[@]} \
    ${jpan[@]} \
    ${hebr[@]} \
    ${hant[@]} \
  ; do
    _allFiles+=( $_font )
    [ ! -f $_font ] && _missingFonts+=( $_font )
  done

  if [ ${#_missingFonts[@]} -gt 0 ]; then
    echo "- Fonts are missing"
    echo -ne "- Mount filesystems as a non-privileged user: "
    touch test.mount
    _unprivilegedMountAllowed=false
    _testLoopDev=$(udisksctl loop-setup -r -f test.mount --no-user-interaction | awk '{print $NF}') && _unprivilegedMountAllowed=true
    _testLoopDev=${_testLoopDev::-1}
    udisksctl loop-delete -b "$_testLoopDev" --no-user-interaction
    rm test.mount

    if [ $_unprivilegedMountAllowed ]; then
      echo "allowed"
      echo "- Downloading fonts directly"
      mkdir -p mnt/http
      echo "  - Mounting HTTP file"
      # Remove '--cache' here to disable HTTPDirFS permanent cache.
      httpdirfs --cache --single-file-mode "$_iso" mnt/http
      echo "  - Creating loop device"
      _isoFile="mnt/http/$(echo "$_iso" | awk -F "/" '{print $NF}')"
      _loopDev=$(udisksctl loop-setup -r -f "${_isoFile}" --no-user-interaction 2>&1 | grep -oE "'.*'" | sed -e "s/'//g")
      # Wait for the loop device to be automatically mounted.
      sleep 5
      # Mount the loop device if not automatically mounted.
      if ! grep -qs $_loopDev /proc/mounts; then
        echo "  - Mounting loop device: $_loopDev"
        udisksctl mount -t udf -b "$_loopDev" --no-user-interaction
      fi
      _mountpoint=$(findmnt -nfr -o target -S $_loopDev)
      echo "  - Loop device mounted as ISO at: $_mountpoint"

      echo "  - Extracting files from online Windows installation image"
      7z e -aoa "${_mountpoint}/LanguagesAndOptionalFeatures/*Fonts*.cab" \
        "*/*".{ttf,ttc}

      echo "  - Unmounting loop device $_loopDev as ISO at: $_mountpoint"
      udisksctl unmount -b "$_loopDev" --no-user-interaction
      echo "  - Deleting loop device: $_loopDev"
      udisksctl loop-delete -b "$_loopDev" --no-user-interaction
      echo "  - Unmounting HTTP file"
      fusermount -uz mnt/http
      rmdir -p mnt/http
    else
      echo "not allowed"
      echo "- Preparing download of full ISO"
      echo "  - Checking free disk space required for download and extraction"
      _freeDiskSpace=$(($(stat -f --format="%a*%S" .)))
      _downloadSize=$(curl -sIL "$_iso" | grep -i Content-Length | tail -n1 | awk '{print $2}' | tr -d '\r\n')
      [ -z $_downloadSize ] && echo -ne "Unable to determine file size of:\n${_iso}\n" && exit 255
      _requiredDiskSpace=$((${_downloadSize}*2))
      if [ $_requiredDiskSpace -gt $_freeDiskSpace ]; then
        echo "Not enough free disk space"
        echo "Needed: $((${_requiredDiskSpace}/1048576)) MiB"
        echo "Available: $((${_freeDiskSpace}/1048576)) MiB"
        exit 255
      fi

      echo "  - Downloading ISO"
      curl -JLO "$_iso"
      echo "  - Extracting Windows installation image"
      7z x $(echo "$_iso" | awk -F "/" '{print $NF}') "LanguagesAndOptionalFeatures/*Fonts*.cab"

      echo "  - Extracting files from local Windows installation image"
      7z e "LanguagesAndOptionalFeatures/*Fonts*.cab" \
        "*/*".{ttf,ttc}

      echo "  - Cleaning up temporary files"
      rm $(echo "$_iso" | awk -F "/" '{print $NF}')
      rm -rf sources
    fi
  fi

  echo "- Verifying file integrity"
  for _i in ${!_allFiles[@]}; do
    echo -ne "  - ${_allFiles[$_i]}: "
    if [ ! -f ${_allFiles[$_i]} ]; then
      echo "MISSING"
      _fail=1
    elif [ "${_sha256sums[$_i]}" == "SKIP" ]; then
      echo "Skipped"
    elif [ "${_sha256sums[$_i]}" == "$(sha256sum ${_allFiles[$_i]} | cut -d' ' -f1)" ]; then
      echo "Pass"
    else
      echo "FAIL, expected ${_sha256sums[$_i]} but got $(sha256sum ${_allFiles[$_i]} | cut -d' ' -f1)"
      _fail=1
    fi
  done
  if [ $_fail ]; then
    echo "One or more files fail the integrity check or are missing. Exiting."
    exit 255
  fi
}

_package() {
    conflicts+=(${pkgname/11/8} ${pkgname/11/10} ttf-win7-fonts${pkgname##*11})

    install -Dm644 $@ -t "$pkgdir/usr/share/fonts/TTF"
}

package_ttf-ms-win11-fod-auto-hans() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (hans)'
    provides=(ttf-ms-win11-fod-hans)
    conflicts=(ttf-ms-win11-fod-hans)
    _package ${hans[@]}
}
package_ttf-ms-win11-fod-auto-guru() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (guru)'
    provides=(ttf-ms-win11-fod-guru)
    conflicts=(ttf-ms-win11-fod-guru)
    _package ${guru[@]}
}
package_ttf-ms-win11-fod-auto-gujr() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (gujr)'
    provides=(ttf-ms-win11-fod-gujr)
    conflicts=(ttf-ms-win11-fod-gujr)
    _package ${gujr[@]}
}
package_ttf-ms-win11-fod-auto-ethi() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (ethi)'
    provides=(ttf-ms-win11-fod-ethi)
    conflicts=(ttf-ms-win11-fod-ethi)
    _package ${ethi[@]}
}
package_ttf-ms-win11-fod-auto-deva() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (deva)'
    provides=(ttf-ms-win11-fod-deva)
    conflicts=(ttf-ms-win11-fod-deva)
    _package ${deva[@]}
}
package_ttf-ms-win11-fod-auto-cher() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (cher)'
    provides=(ttf-ms-win11-fod-cher)
    conflicts=(ttf-ms-win11-fod-cher)
    _package ${cher[@]}
}
package_ttf-ms-win11-fod-auto-cans() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (cans)'
    provides=(ttf-ms-win11-fod-cans)
    conflicts=(ttf-ms-win11-fod-cans)
    _package ${cans[@]}
}
package_ttf-ms-win11-fod-auto-beng() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (beng)'
    provides=(ttf-ms-win11-fod-beng)
    conflicts=(ttf-ms-win11-fod-beng)
    _package ${beng[@]}
}
package_ttf-ms-win11-fod-auto-arab() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (arab)'
    provides=(ttf-ms-win11-fod-arab)
    conflicts=(ttf-ms-win11-fod-arab)
    _package ${arab[@]}
}
package_ttf-ms-win11-fod-auto-thai() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (thai)'
    provides=(ttf-ms-win11-fod-thai)
    conflicts=(ttf-ms-win11-fod-thai)
    _package ${thai[@]}
}
package_ttf-ms-win11-fod-auto-telu() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (telu)'
    provides=(ttf-ms-win11-fod-telu)
    conflicts=(ttf-ms-win11-fod-telu)
    _package ${telu[@]}
}
package_ttf-ms-win11-fod-auto-taml() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (taml)'
    provides=(ttf-ms-win11-fod-taml)
    conflicts=(ttf-ms-win11-fod-taml)
    _package ${taml[@]}
}
package_ttf-ms-win11-fod-auto-syrc() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (syrc)'
    provides=(ttf-ms-win11-fod-syrc)
    conflicts=(ttf-ms-win11-fod-syrc)
    _package ${syrc[@]}
}
package_ttf-ms-win11-fod-auto-sinh() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (sinh)'
    provides=(ttf-ms-win11-fod-sinh)
    conflicts=(ttf-ms-win11-fod-sinh)
    _package ${sinh[@]}
}
package_ttf-ms-win11-fod-auto-paneuropean() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (paneuropean)'
    provides=(ttf-ms-win11-fod-paneuropean)
    conflicts=(ttf-ms-win11-fod-paneuropean)
    _package ${paneuropean[@]}
}
package_ttf-ms-win11-fod-auto-orya() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (orya)'
    provides=(ttf-ms-win11-fod-orya)
    conflicts=(ttf-ms-win11-fod-orya)
    _package ${orya[@]}
}
package_ttf-ms-win11-fod-auto-mlym() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (mlym)'
    provides=(ttf-ms-win11-fod-mlym)
    conflicts=(ttf-ms-win11-fod-mlym)
    _package ${mlym[@]}
}
package_ttf-ms-win11-fod-auto-laoo() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (laoo)'
    provides=(ttf-ms-win11-fod-laoo)
    conflicts=(ttf-ms-win11-fod-laoo)
    _package ${laoo[@]}
}
package_ttf-ms-win11-fod-auto-kore() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (kore)'
    provides=(ttf-ms-win11-fod-kore)
    conflicts=(ttf-ms-win11-fod-kore)
    _package ${kore[@]}
}
package_ttf-ms-win11-fod-auto-knda() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (knda)'
    provides=(ttf-ms-win11-fod-knda)
    conflicts=(ttf-ms-win11-fod-knda)
    _package ${knda[@]}
}
package_ttf-ms-win11-fod-auto-khmr() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (khmr)'
    provides=(ttf-ms-win11-fod-khmr)
    conflicts=(ttf-ms-win11-fod-khmr)
    _package ${khmr[@]}
}
package_ttf-ms-win11-fod-auto-jpan() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (jpan)'
    provides=(ttf-ms-win11-fod-jpan)
    conflicts=(ttf-ms-win11-fod-jpan)
    _package ${jpan[@]}
}
package_ttf-ms-win11-fod-auto-hebr() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (hebr)'
    provides=(ttf-ms-win11-fod-hebr)
    conflicts=(ttf-ms-win11-fod-hebr)
    _package ${hebr[@]}
}
package_ttf-ms-win11-fod-auto-hant() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (hant)'
    provides=(ttf-ms-win11-fod-hant)
    conflicts=(ttf-ms-win11-fod-hant)
    _package ${hant[@]}
}
