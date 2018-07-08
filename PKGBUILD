# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=elastix
pkgver=4.9.0
pkgrel=2
pkgdesc='Toolbox for rigid and nonrigid registration of images'
arch=('x86_64')
url='http://elastix.isi.uu.nl/'
license=('apache')
provides=()
depends=('insight-toolkit>=4.13' 'ann')
makedepends=('cmake')
optdepends=()
conflicts=('elastix-git' 'elastix-bin')
source=("https://github.com/SuperElastix/elastix/archive/${pkgver}.tar.gz")
sha512sums=('5380529a27d9aef4d93147c6de3cb0930fd31851106cfb41f35556b6e6a5406058de60bdb6ec699f17631861fd518f370b0f0a170db5d254eeafb529283d618c')

prepare() {
	_build_dir="${srcdir}/${pkgname}-${pkgver}/build"

	mkdir "$_build_dir" || :
	cd "$_build_dir"

	cmake \
		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DCMAKE_BUILD_TYPE:STRING=Release \
		-DMAKE_CXX_FLAGS:STRING="--std=c++11" \
		-DBUILD_TESTING:BOOL=OFF \
		-DBUILD_SHARED_LIBS:BOOL=ON \
		-DELASTIX_BUILD_EXECUTABLE:BOOL=ON \
		-DELASTIX_USE_ALL_COMPONENTS:BOOL=OFF \
		-DELASTIX_USE_OPENCL:BOOL=OFF \
		-DELASTIX_USE_OPENMP:BOOL=OFF \
		-DELASTIX_USE_EIGEN:BOOL=OFF \
		-DELASTIX_USE_OPENCL:BOOL=OFF \
		-DELASTIX_USE_AdaptiveStochasticGradientDescent:BOOL=ON \
		-DELASTIX_USE_AdvancedAffineTransformElastix:BOOL=ON \
		-DELASTIX_USE_AdvancedBSplineTransform:BOOL=ON \
		-DELASTIX_USE_AdvancedKappaStatisticMetric:BOOL=ON \
		-DELASTIX_USE_AdvancedMattesMutualInformationMetric:BOOL=ON \
		-DELASTIX_USE_AdvancedMeanSquaresMetric:BOOL=ON \
		-DELASTIX_USE_AdvancedNormalizedCorrelationMetric:BOOL=ON \
		-DELASTIX_USE_AffineDTITransformElastix:BOOL=ON \
		-DELASTIX_USE_AffineLogTransformElastix:BOOL=OFF \
		-DELASTIX_USE_BSplineInterpolator:BOOL=ON \
		-DELASTIX_USE_BSplineInterpolatorFloat:BOOL=ON \
		-DELASTIX_USE_BSplineResampleInterpolator:BOOL=ON \
		-DELASTIX_USE_BSplineResampleInterpolatorFloat:BOOL=ON \
		-DELASTIX_USE_BSplineStackTransform:BOOL=ON \
		-DELASTIX_USE_BSplineTransformWithDiffusion:BOOL=ON \
		-DELASTIX_USE_CMAEvolutionStrategy:BOOL=ON \
		-DELASTIX_USE_CUDAResampler:BOOL=OFF \
		-DELASTIX_USE_ConjugateGradient:BOOL=ON \
		-DELASTIX_USE_ConjugateGradientFRPR:BOOL=ON \
		-DELASTIX_USE_CorrespondingPointsEuclideanDistanceMetric:BOOL=ON \
		-DELASTIX_USE_DeformationFieldTransform:BOOL=ON \
		-DELASTIX_USE_DisplacementMagnitudePenalty:BOOL=ON \
		-DELASTIX_USE_DistancePreservingRigidityPenalty:BOOL=ON \
		-DELASTIX_USE_EulerTransformElastix:BOOL=ON \
		-DELASTIX_USE_FiniteDifferenceGradientDescent:BOOL=ON \
		-DELASTIX_USE_FixedGenericPyramid:BOOL=ON \
		-DELASTIX_USE_FixedRecursivePyramid:BOOL=ON \
		-DELASTIX_USE_FixedShrinkingPyramid:BOOL=ON \
		-DELASTIX_USE_FixedSmoothingPyramid:BOOL=ON \
		-DELASTIX_USE_FullSampler:BOOL=ON \
		-DELASTIX_USE_FullSearch:BOOL=ON \
		-DELASTIX_USE_GradientDifferenceMetric:BOOL=ON \
		-DELASTIX_USE_GridSampler:BOOL=ON \
		-DELASTIX_USE_KNNGraphAlphaMutualInformationMetric:BOOL=OFF \
		-DELASTIX_USE_LinearInterpolator:BOOL=ON \
		-DELASTIX_USE_LinearResampleInterpolator:BOOL=ON \
		-DELASTIX_USE_MissingStructurePenalty:BOOL=ON \
		-DELASTIX_USE_MovingRecursivePyramid:BOOL=ON \
		-DELASTIX_USE_MovingShrinkingPyramid:BOOL=ON \
		-DELASTIX_USE_MovingSmoothingPyramid:BOOL=ON \
		-DELASTIX_USE_MultiBSplineTransformWithNormal:BOOL=ON \
		-DELASTIX_USE_MultiInputRandomCoordinateSampler:BOOL=ON \
		-DELASTIX_USE_MultiMetricMultiResolutionRegistration:BOOL=ON \
		-DELASTIX_USE_MultiResolutionRegistration:BOOL=ON \
		-DELASTIX_USE_MultiResolutionRegistrationWithFeatures:BOOL=ON \
		-DELASTIX_USE_MutualInformationHistogramMetric:BOOL=ON \
		-DELASTIX_USE_MyStandardResampler:BOOL=ON \
		-DELASTIX_USE_NearestNeighborInterpolator:BOOL=ON \
		-DELASTIX_USE_NearestNeighborResampleInterpolator:BOOL=ON \
		-DELASTIX_USE_NormalizedGradientCorrelationMetric:BOOL=ON \
		-DELASTIX_USE_NormalizedMutualInformationMetric:BOOL=ON \
		-DELASTIX_USE_OpenCLFixedGenericPyramid:BOOL=OFF \
		-DELASTIX_USE_OpenCLMovingGenericPyramid:BOOL=OFF \
		-DELASTIX_USE_OpenCLResampler:BOOL=OFF \
		-DELASTIX_USE_PatternIntensityMetric:BOOL=ON \
		-DELASTIX_USE_PolydataDummyPenalty:BOOL=ON \
		-DELASTIX_USE_Powell:BOOL=ON \
		-DELASTIX_USE_QuasiNewtonLBFGS:BOOL=ON \
		-DELASTIX_USE_RSGDEachParameterApart:BOOL=ON \
		-DELASTIX_USE_RandomCoordinateSampler:BOOL=ON \
		-DELASTIX_USE_RandomSampler:BOOL=ON \
		-DELASTIX_USE_RandomSamplerSparseMask:BOOL=ON \
		-DELASTIX_USE_RayCastInterpolator:BOOL=ON \
		-DELASTIX_USE_RayCastResampleInterpolator:BOOL=ON \
		-DELASTIX_USE_ReducedDimensionBSplineInterpolator:BOOL=ON \
		-DELASTIX_USE_ReducedDimensionBSplineResampleInterpolator:BOOL=ON \
		-DELASTIX_USE_RegularStepGradientDescent:BOOL=ON \
		-DELASTIX_USE_SimilarityTransformElastix:BOOL=ON \
		-DELASTIX_USE_Simplex:BOOL=ON \
		-DELASTIX_USE_SimultaneousPerturbation:BOOL=ON \
		-DELASTIX_USE_SplineKernelTransform:BOOL=ON \
		-DELASTIX_USE_StandardGradientDescent:BOOL=ON \
		-DELASTIX_USE_StatisticalShapePenalty:BOOL=ON \
		-DELASTIX_USE_TransformBendingEnergyPenanalty:BOOL=ON \
		-DELASTIX_USE_TransformRigidityPenalty:BOOL=ON \
		-DELASTIX_USE_TranslationTransformElastix:BOOL=ON \
		-DELASTIX_USE_VarianceOverLastDimensionMetric:BOOL=ON \
		-DELASTIX_USE_ViolaWellsMutualInformationMetric:BOOL=ON \
		-DELASTIX_USE_WeightedCombinationTransformElastix:BOOL=ON \
		..
}

build() {
	cd "$_build_dir"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"

	make install DESTDIR="${pkgdir}"

	cd ..

	install -D -m644 \
		"LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -D -m644 \
		"NOTICE" \
		"$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
